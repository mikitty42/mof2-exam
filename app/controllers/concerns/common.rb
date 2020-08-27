module Common
  extend ActiveSupport::Concern

  def set_categories
    @nearest_stations = @property.nearest_stations
  end

  def set_category
    @property.nearest_stations.build
  end
end
