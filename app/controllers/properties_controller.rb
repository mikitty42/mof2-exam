class PropertiesController < ApplicationController
  include Common
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end


  def new
    @property = Property.new
    3.times { @property.nearest_stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to({action: :index}, notice:"物件の登録に成功しました")
    else
      flash.now[:alert] = '物件の登録に失敗しました'
      render :new
    end
  end

  def show
    set_categories
  end

  def edit
    set_category
  end

  def update
    if @property.update(property_params)
        redirect_to({action: :index}, notice:"物件の編集に成功しました")
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_path, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

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
