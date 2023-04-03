class PostController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to(post_path(@post.id))
    else
      render(:new)
    end
  end

  def update
    if @post.update(post_params)
      redirect_to(post_path(@post.id))
    else
      render(:edit)
    end
  end

  def destroy
    @post.destroy
    redirect_to(home_index_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,
                                 :body,
                                 :user_id,
                                 :category)
  end
end
