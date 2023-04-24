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
      can(:manage, Inspection)
    end

    if user.engineer?
      can(:manage, Device)
      cannot(:manage, :inspection)
      cannot(:manage, :armstrong)
    end
  end
end
