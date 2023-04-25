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
      can(:read, Inspection)
      can([:edit, :update], Inspection, performer_id: user.id)
      can(:create, Inspection)
      can([:accept_task, :complete_verification, :fail_verification, :send_to_repair, :return_from_repair],
          Inspection, performer_id: user.id)
    end

    if user.engineer?
      can(:manage, Device)
      cannot(:manage, :inspection)
      cannot(:manage, :armstrong)
    end
  end
end
