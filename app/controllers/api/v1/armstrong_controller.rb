module Api
  class V1::ArmstrongController < ApplicationController
    def index
      channels = Channel.all
      result = channels.sort { |a, b| a[:server_id] <=> b[:server_id] }

      render(json: result,
             include: [
               device: { include: [device_model: { only: [:name] }] },
               room: { only: [:name] },
             ])
    end
  end
end
