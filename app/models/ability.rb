# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    cannot(:read, :all)

    if user.present?
      can(:read, Post)
    else
      cannot(:read, :all)
    end
    if user.admin?
      can(:manage, :all)
    end

    if user.dosimetrist?
    end

    if user.engineer?
      can(:manage, Device)
      cannot(:manage, User)
      cannot(:manage, Inspection)
    end
  end
end
