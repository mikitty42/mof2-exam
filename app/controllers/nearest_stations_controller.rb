class NearestStationsController < ApplicationController
  include Common
  before_action :set_nearest_station, only: [:show, :edit, :update, :destroy]
  def index
    @nearest_stations = NearestStation.all
  end


  def new
    @nearest_station = NearestStation.new
  end

  def create
    @nearest_station = NearestStation.new(nearest_station_params)

    respond_to do |format|
      if @nearest_station.save
        format.html { redirect_to @nearest_station, notice: 'Nearest station was successfully created.' }
        format.json { render :show, status: :created, location: @nearest_station }
      else
        format.html { render :new }
        format.json { render json: @nearest_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    set_categories
  end

  def edit
    set_category
  end

  def update
    respond_to do |format|
      if @nearest_station.update(nearest_station_params)
        format.html { redirect_to @nearest_station, notice: 'Nearest station was successfully updated.' }
        format.json { render :show, status: :ok, location: @nearest_station }
      else
        format.html { render :edit }
        format.json { render json: @nearest_station.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @nearest_station.destroy
    respond_to do |format|
      format.html { redirect_to nearest_stations_url, notice: 'Nearest station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_nearest_station
      @nearest_station = NearestStation.find(params[:id])
    end

    def nearest_station_params
      params.require(:nearest_station).permit(:route_name, :station_name, :minutes_walk, :property_id)
    end
end
