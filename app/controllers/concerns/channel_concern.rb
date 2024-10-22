module ChannelConcern
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    def channel_index
      @query = Channel.ransack(params[:q])
      @pagy, @channels = pagy(@query.result.order(:id))
    end

    def channel_create
      @channel = Channel.new(channel_params)

      @channel.event_datetime = Time.now
      @channel.is_online = true

      if @channel.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def channel_update
      if @channel.update(channel_params)
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def channel_destroy
      assigned_histories = History.where(channel_id: @channel.id).count

      if assigned_histories.zero?
        if @channel.destroy
          flash[:success] = t('message.admin.channel.delete.success')
        else
          flash[:error] = t('message.admin.channel.delete.error')
        end
      else
        flash[:error] = t('message.admin.channel.delete.error')
      end
      redirect_to(admin_channel_index_path)
    end

    private

    def set_channel
      @channel = Channel.find(params[:id])
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
