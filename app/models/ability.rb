# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    puts(user)
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
      can(:read, :all)
      cannot(:read, User)
      cannot(:read, Inspection)
    end
  end
end
