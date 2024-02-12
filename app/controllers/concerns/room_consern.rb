module RoomConsern
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    def room_index
      @query = Room.ransack(params[:q])
      @pagy, @rooms = pagy(@query.result.order(:name))
    end

    def room_create
      @room = Room.new(room_params)

      if @room.save
        redirect_back(fallback_location: root_path)
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def room_update
      if @room.update(room_params)
        redirect_back(fallback_location: root_path)
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def room_destroy
      assigned_models_count = ControlPoint.where(room_id: params[:id]).count

      if assigned_models_count.zero?
        @room.destroy
      else
        flash[:error] = t('message.admin.room.delete.error')
      end
      redirect_to(admin_room_index_path)
    end

    private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(
        :name,
        :building_id,
        :level,
        :description,
      )
    end
  end
end
