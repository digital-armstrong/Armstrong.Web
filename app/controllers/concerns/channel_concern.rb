module ChannelConcern
  extend ActiveSupport::Concern

  included do
    def channel_index
      @query = Channel.ransack(params[:q])
      @pagy, @channels = pagy(@query.result.order(:id))
    end
  end
end
