# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
      @comment = resource_post.comments.build(comments_params)
      @comment.user = current_user

      if @comment.save
        redirect_to(resource_post, notice: t('.success'))
      else
        redirect_to(resource_post, alert: @comment.errors.full_messages.join('. '))
      end
    end

    private

    def comments_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
