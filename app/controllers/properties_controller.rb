class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @nearest_stations = @property.nearest_stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    3.times { @property.nearest_stations.build }
  end

  # GET /properties/1/edit
  def edit
    @property.nearest_stations.build
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = '物件の登録に成功しました'
      redirect_to :root
    else
      flash.now[:alert] = '物件の登録に失敗しました'
      render :new
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    if @property.update(property_params)
        redirect_to properties_path,notice: '物件の編集に成功しました'
    else
      render :edit
    end
  end


  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(
        :property_name,
        :rent,
        :age,
        :note,
        :address,
        nearest_stations_attributes: [
        :station_name,
        :route_name,
        :minutes_walk,
        :property_id,
        :id,
        :_destroy,
      ],
      )
    end
end
