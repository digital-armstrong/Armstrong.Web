# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    cannot(:manage, :device_admin)
    cannot(:manage, :device_model_admin)
    cannot(:manage, :device_reg_group_admin)
    cannot(:manage, :manufacturer_admin)
    cannot(:manage, :measurement_class_admin)
    cannot(:manage, :device_component_admin)
    cannot(:manage, :measurement_group_admin)
    cannot(:manage, :supplementary_kit_admin)

    if user.present?
      can([:read, :create], Post)
    else
      cannot(:read, :all)
    end

    if user.admin?
      can(:manage, :all)
    end

    if user.dosimetrist?
    end

    if user.inspector?
      inspector(user)
    end

    if user.engineer?
      can([:manage, :create_inspection], Device, service_id: user.service_id)
      cannot(:destroy, Device)
      can(:create, [DeviceModel, SupplementaryKit, DeviceRegGroup, MeasurementClass, MeasurementGroup,
                    Manufacturer, DeviceComponent])
      can([:read, :service_tasks], Inspection)
      cannot(:manage, :armstrong)
    end
  end

  def inspector(user)
    can([:read, :accept_task, :new_tasks, :my_tasks, :completed_tasks], Inspection)
    can([:complete_verification, :fail_verification, :close, :send_to_repair, :return_from_repair,
         :send_from_repair_to_verification, :send_from_repair_to_close],
        Inspection, performer_id: user.id)
    can(:update, Inspection.where(performer_id: user.id))
  end
end
