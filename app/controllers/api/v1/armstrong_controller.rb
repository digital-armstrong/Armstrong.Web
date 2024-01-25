module Api
  class V1::ArmstrongController < ApplicationController
    after_action :set_csp_header

    def index
      channels = Channel.joins(:control_point, :server, :service)
      result = channels.sort { |a, b| a[:server_id] <=> b[:server_id] }

      render(json: result,
             include: [
              :server,
              :service,
              control_point: {
                include: [
                  :room,
                  device: { include: :device_model }
                ]},
            ])
    end

    private

    def set_csp_header
      response.headers['Content-Security-Policy'] = "default-src 'self' http://0.0.0.0/api/v1/armstrong;"
    end
  end
end
