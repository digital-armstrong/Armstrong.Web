module Api
  class V1::ArmstrongController < ApplicationController
    def index
      channels = Channel.all
      result = channels.sort { |a, b| a[:server_id] <=> b[:server_id] }

      render(json: result)
    end
  end
end
