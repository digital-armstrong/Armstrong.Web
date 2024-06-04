# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_like, only: [:destroy]

    def create
      resource_post.likes.find_or_create_by(user: current_user)
      redirect_to(resource_post)
    end

    def destroy
      @like&.destroy
      redirect_to(resource_post)
    end

    private

    def set_like
      @like = resource_post.likes.find_by(user: current_user)
    end
  end
end
