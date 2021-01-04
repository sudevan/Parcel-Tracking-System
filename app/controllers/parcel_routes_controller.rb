class ParcelRoutesController < ApplicationController
  before_action :set_parcel_route, only: [:show, :edit, :update, :destroy]

  # GET /parcel_routes
  # GET /parcel_routes.json
  def index
    @parcel_routes = ParcelRoute.all
  end

  # GET /parcel_routes/1
  # GET /parcel_routes/1.json
  def show
  end

  # GET /parcel_routes/new
  def new
    @parcel_route = ParcelRoute.new
  end

  # GET /parcel_routes/1/edit
  def edit
  end

  # POST /parcel_routes
  # POST /parcel_routes.json
  def create
    @parcel_route = ParcelRoute.new(parcel_route_params)

    respond_to do |format|
      if @parcel_route.save
        format.html { redirect_to @parcel_route, notice: 'Parcel route was successfully created.' }
        format.json { render :show, status: :created, location: @parcel_route }
      else
        format.html { render :new }
        format.json { render json: @parcel_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcel_routes/1
  # PATCH/PUT /parcel_routes/1.json
  def update
    respond_to do |format|
      if @parcel_route.update(parcel_route_params)
        format.html { redirect_to @parcel_route, notice: 'Parcel route was successfully updated.' }
        format.json { render :show, status: :ok, location: @parcel_route }
      else
        format.html { render :edit }
        format.json { render json: @parcel_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcel_routes/1
  # DELETE /parcel_routes/1.json
  def destroy
    @parcel_route.destroy
    respond_to do |format|
      format.html { redirect_to parcel_routes_url, notice: 'Parcel route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcel_route
      @parcel_route = ParcelRoute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parcel_route_params
      params.require(:parcel_route).permit(:route_id, :city_1, :city_2)
    end
end
