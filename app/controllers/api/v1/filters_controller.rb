module Api
  class V1::FiltersController < ApplicationController
    def index
      if params[:id].present?
        measurement_group = MeasurementGroup.find(params[:id])
        measurement_classes = measurement_group.measurement_classes
      else
        measurement_classes = MeasurementClass.all
      end

      render(json: measurement_classes)
    end
  end
end
