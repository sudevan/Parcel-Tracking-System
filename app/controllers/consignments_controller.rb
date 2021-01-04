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
    
    #@History = History.all(:conditions => ["trackid = ?", @tid])
    #@History1 = History.where(trackid: params[:trackid] )
    @Cons=Consignment.find(params[:id])
    @tid=@Cons.tracking_id
    @History = History.where(trackid: @tid )
    puts "tid is :"
    puts @tid
    puts @History
  end

  # GET /consignments/new
  def new
    @servicelocations = ParcelRoute.all.map { |p| p.city_1 }
    @servicelocations = @servicelocations.uniq
    @consignment = Consignment.new

    #TwilioClient.new.send_text("+917200668804","Hello")
  end

  # GET /consignments/1/edit
  def edit
    @servicelocations = ParcelRoute.all.map { |p| p.city_1 }
    @servicelocations = @servicelocations.uniq
  end

  # POST /consignments
  # POST /consignments.json
  def create
        
    @consignment = Consignment.new(consignment_params)
    @consignment.status = 1
    @paths = RouteFind.new.findpath(@consignment.source_city, @consignment.destination_city )
    @consignment.estimated_time = @paths.last
    puts ".......Controller "  
    puts @paths
    respond_to do |format|
      if @consignment.save
        #puts "Consignment Paramets"
        #puts @consignment.id
        cid= @consignment.id.to_s
        #puts cid
        @consignment.tracking_id="IN-"+generate_code(5)+"-"+cid
        @consignment.save
        @History = History.new(:trackid =>@consignment.tracking_id,:event=>"Consignment Registered" )
        if @History.save
          #@client.send_text(@consignment.source_contact,"Consignment Registered.")
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
      @History = History.new(:trackid =>@consignment.tracking_id,:user=> current_user.email ,:event=>"Scheduled Pickup from Customer" )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 

    when 2
      @consignment.status=3
      @buttontext="Pickup"
      @History = History.new(:trackid =>@consignment.tracking_id,:user=> current_user.email ,:event=>"Parcel Received from Customer" )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 

    when 3
      @consignment.current_city = @consignment.source_city
      @consignment.status=4
      @buttontext="Received"
      
    when 4
      next_location = RouteFind.new.findpath( @consignment.current_city,@consignment.destination_city)
      @consignment.next_city = next_location[1]
      puts next_location
      puts ".......Status 4 ............."
      puts next_location[1]
      @consignment.status = 5
      @buttontext="Left"
      @History = History.new(:trackid =>@consignment.tracking_id,:user=> current_user.email ,:event=>"Parcel Left from Base Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
    when 5
      if @consignment.next_city == @consignment.destination_city
        @consignment.current_city = @consignment.next_city
        @consignment.status=6
        @buttontext="Received"
        @History = History.new(:trackid =>@consignment.tracking_id,:user=> current_user.email ,:event=>"Parcel Received at Destination Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
      else
        @consignment.current_city = @consignment.next_city
        @consignment.status=4
        @buttontext="Received"
        @History = History.new(:trackid =>@consignment.tracking_id,:user=> current_user.email ,:event=>"Parcel Received at Intermediate Node at "+@consignment.current_location.to_s )
        if @History.save
          
        else
          format.html { render :new }
          format.json { render json: @History.errors, status: :unprocessable_entity }
        end 
      end
    when 6
      @consignment.status=7
      @buttontext="Deliver"
      @History = History.new(:trackid =>@consignment.tracking_id,:user=> current_user.email ,:event=>"Parcel Out for Delivery")
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
    puts "........"
    puts consignment_params
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
      params.require(:consignment).permit(:user_id, :destination_pin, :source_pin, :status, :weight, :tracking_id, :source_contact, :destination_contact, :current_location, :next_location, :source_city, :destination_city, :current_city, :next_city)
    end
    def generate_code(number)
      charset = Array('A'..'Z') + Array('1'..'9')
      Array.new(number) { charset.sample }.join
    end
end
