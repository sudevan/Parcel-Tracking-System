class ConsignmentsController < ApplicationController
  before_action :set_consignment, only: [:show, :edit, :update, :destroy]

  # GET /consignments
  # GET /consignments.json
  def index
    @consignments = Consignment.all
   
  end

  # GET /consignments/1
  # GET /consignments/1.json
  def show
    
  end

  # GET /consignments/new
  def new
    @servicelocations = Route.all.map { |p| p.s_pin }
    @consignment = Consignment.new

    #TwilioClient.new.send_text("+917200668804","Hello")
  end

  # GET /consignments/1/edit
  def edit
  end

  # POST /consignments
  # POST /consignments.json
  def create    
    @consignment = Consignment.new(consignment_params)

    @consignment.status = 1
    respond_to do |format|
      if @consignment.save
        #puts "Consignment Paramets"
        #puts @consignment.id
        @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Consignment Registered" )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end  
        format.html { redirect_to @consignment, notice: 'Consignment was successfully created.' }
        format.json { render :show, status: :created, location: @consignment }
        puts "This is a sample"
        puts @consignment.id
      else
        format.html { render :new }
        format.json { render json: @consignment.errors, status: :unprocessable_entity }
      end
    end
  end
  def approve
    @consignment = Consignment.find(params[:id])
    case @consignment.status
    when 1
      @consignment.status=2
      @buttontext="Schedule"
      @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Scheduled Pickup from Customer" )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 

    when 2
      @consignment.status=3
      @buttontext="Pickup"
      @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Parcel Received from Customer" )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 

    when 3
      @consignment.current_location = @consignment.source_pin
      @consignment.status=4
      @buttontext="Received"
      @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Parcel Received at Base Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
    when 4
      next_location = Route.find_by(s_pin: @consignment.current_location).d_pin
      @consignment.next_location = next_location
      @consignment.status = 5
      @buttontext="Left"
      @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Parcel Left from Base Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
    when 5
      if @consignment.next_location == @consignment.destination_pin
        @consignment.current_location = @consignment.next_location
        @consignment.status=6
        @buttontext="Received"
        @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Parcel Received at Destination Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
      else
        @consignment.current_location = @consignment.next_location
        @consignment.status=4
        @buttontext="Received"
        @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Parcel Received at Intermediate Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
      end
    when 6
      @consignment.status=7
      @buttontext="Deliver"
      @History = History.new(:trackid =>@consignment.id,:user=> current_user.email ,:event=>"Parcel Out for Delivery")
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
    when 7
      @buttontext="Show History"
    end
  end
  # PATCH/PUT /consignments/1
  # PATCH/PUT /consignments/1.json
  def update 
    respond_to do |format|
      if @consignment.update(consignment_params)
        format.html { redirect_to consignments_url, notice: 'Consignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @consignment }
       
      else
        format.html { render :edit }
        format.json { render json: @consignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consignments/1
  # DELETE /consignments/1.json
  def destroy
    @consignment.destroy
    respond_to do |format|
      format.html { redirect_to consignments_url, notice: 'Consignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consignment
      @consignment = Consignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consignment_params
      params.require(:consignment).permit(:user_id, :destination_pin, :source_pin, :status, :weight, :tracking_id, :source_contact, :destination_contact, :current_location, :next_location)
    end
end
