# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can(:read, Post)
    if user.admin?
      can(:manage, :all)
    end

    if user.engineer?
      can(:read, :all)
    end
  end
end
