module ChannelConcern
  extend ActiveSupport::Concern

  included do
    def channel_index
      @query = Channel.ransack(params[:q])
      @pagy, @channels = pagy(@query.result.order(:id))
    end

    def channel_create
      @channel = Channel.new(channel_params)

      if @channel.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    private

    def set_channel
      @channel = Channel.find(channel_params[:id])
    end

    def channel_params
      params.require(:channel).permit(
        :channel_id,
        :server_id,
        :control_point_id,
        :location_description,
        :self_background,
        :pre_emergency_limit,
        :emergency_limit,
        :consumption,
        :conversion_coefficient,
        :service_id,
      )
    end
  end
end
