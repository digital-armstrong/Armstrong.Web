module Api
  class FiltersController < ApplicationController
    def index
      measurement_group = MeasurementGroup.find(params[:id])
      measurement_class = measurement_group.measurement_classes
      render(json: measurement_class)
    end
  end
end
