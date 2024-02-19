module ServerConcern
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    def server_index
      @query = Server.ransack(params[:q])
      @pagy, @servers = pagy(@query.result.order(:name))
    end

    def server_create
      @server = Server.new(server_params)

      if @server.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def server_update
      if @server.update(server_params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def server_destroy
      assigned_models_count = Channel.where(server_id: params[:id]).count

      if assigned_models_count.zero?
        @server.destroy
      else
        flash[:error] = t('message.admin.server.delete.error')
      end
      redirect_to(admin_server_index_path)
    end

    private

    def set_server
      @server = Server.find(params[:id])
    end

    def server_params
      params.require(:server).permit(
        :name,
        :ip_address,
        :inventory_id,
        :service_id,
        :room_id,
      )
    end
  end
end
