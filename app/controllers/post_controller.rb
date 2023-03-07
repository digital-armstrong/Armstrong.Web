class PostController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index; end

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

  def update; end

  def delete; end

  private

  def post_params
    params.require(:post).permit(:title,
                                 :body,
                                 :user_id,
                                 :category)
  end
end
