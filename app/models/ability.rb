# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.ilya?
      cannot(:read, Post)
      can(:read, Device)
    elsif user.admin?
      can(:manage, :all)
    end
  end
end
