module Api
  class V1::HistoriesController < ApplicationController
    before_action :set_channel, only: [:show]

    def index
      datetime_interval = diff_hours(params[:start_datetime], params[:end_datetime])
      histories = if params[:start_datetime].present? && params[:end_datetime].present? && datetime_interval < 2
                    History.where(event_datetime: params[:start_datetime]..params[:end_datetime])
                  else
                    {
                      code: 403,
                      message: 'Forbidden. Parameters is not a valid or range of the datetime is too long.',
                      hint: 'The interval between start_datetime and end_datetime should be no more than two hours.',
                    }.to_json
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

    # Returns the integer value of the difference
    # between the start and end datetime values
    def diff_hours(start_date, end_date)
      diff_in_seconds = end_date.to_time - start_date.to_time
      (diff_in_seconds / (60**2)).to_i
    end
  end
end
