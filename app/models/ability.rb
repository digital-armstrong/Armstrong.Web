# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    cannot(:manage, :device_admin)

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
      can([:read, :accept_task, :new_tasks, :my_tasks, :completed_tasks], Inspection)
      can([:edit, :update, :complete_verification, :fail_verification, :close, :send_to_repair, :return_from_repair],
          Inspection, performer_id: user.id)
    end

    if user.engineer?
      can(:manage, Device)
      can(:create_inspection, Device)
      can(:create, [DeviceModel, SupplementaryKit, DeviceRegGroup, MeasurementClass, MeasurementGroup,
        Manufacturer, DeviceComponent])
      cannot(:manage, :inspection)
      cannot(:manage, :armstrong)
    end
  end
end
