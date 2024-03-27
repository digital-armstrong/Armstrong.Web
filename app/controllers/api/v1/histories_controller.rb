module Api
  class V1::HistoriesController < ApplicationController
    before_action :set_channel, only: [:show]

    def index
      histories = if params[:start_datetime].present? && params[:end_datetime].present?
                    History.where(event_datetime: params[:start_datetime]..params[:end_datetime])
                  else
                    []
                  end

      render(json: histories, except: [:id, :event_impulse_value, :event_not_system_value, :created_at, :updated_at])
    end

    def show
      histories = if params[:start_datetime].present? && params[:end_datetime].present?
                    History.where(event_datetime: params[:start_datetime]..params[:end_datetime],
                                  channel_id: @channel.id)
                  else
                    History.where(channel_id: @channel.id).last(100)
                  end

      result = histories.sort { |a, b| a[:event_datetime] <=> b[:event_datetime] }
      render(json: result, except: [:created_at, :updated_at])
    end

    private

    def set_channel
      @channel = Channel.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render(json: { error: e }, status: :not_found)
    end
  end
end
