class NearestStationsController < ApplicationController
  before_action :set_nearest_station　, only: [:show, :edit, :update, :destroy]

  # GET /nearest_station　s
  # GET /nearest_station　s.json
  def index
    @nearest_stations = NearestStation　.all
  end

  # GET /nearest_station　s/1
  # GET /nearest_station　s/1.json
  def show
  end

  # GET /nearest_station　s/new
  def new
    @nearest_station　 = NearestStation　.new
  end

  # GET /nearest_station　s/1/edit
  def edit
  end

  # POST /nearest_station　s
  # POST /nearest_station　s.json
  def create
    @nearest_station　 = NearestStation　.new(nearest_station　_params)

    respond_to do |format|
      if @nearest_station　.save
        format.html { redirect_to @nearest_station　, notice: 'Nearest station　 was successfully created.' }
        format.json { render :show, status: :created, location: @nearest_station　 }
      else
        format.html { render :new }
        format.json { render json: @nearest_station　.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nearest_station　s/1
  # PATCH/PUT /nearest_station　s/1.json
  def update
    respond_to do |format|
      if @nearest_station　.update(nearest_station　_params)
        format.html { redirect_to @nearest_station　, notice: 'Nearest station　 was successfully updated.' }
        format.json { render :show, status: :ok, location: @nearest_station　 }
      else
        format.html { render :edit }
        format.json { render json: @nearest_station　.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nearest_station　s/1
  # DELETE /nearest_station　s/1.json
  def destroy
    @nearest_station　.destroy
    respond_to do |format|
      format.html { redirect_to nearest_station　s_url, notice: 'Nearest station　 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nearest_station　
      @nearest_station　 = NearestStation　.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nearest_station　_params
      params.fetch(:nearest_station　, {})
    end
end
