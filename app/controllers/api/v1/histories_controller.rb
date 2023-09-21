module Api
  class V1::HistoriesController < ApplicationController
    before_action :set_channel, only: [:show]

    def show
      histories = History.select { |hs| hs.channel_id == @channel_id }

      result = histories.sort { |a, b| a[:event_datetime] <=> b[:event_datetime] }

      render(json: result)
    end

    private

    def set_channel
      @channel = Channel.find(params[:id])
      @channel_id = @channel.id
    end
  end
end
