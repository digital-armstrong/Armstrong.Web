class PostController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
  end

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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to(post_path(@post.id))
    else
      render(:edit)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(home_index_path)
  end

  private

  def post_params
    params.require(:post).permit(:title,
                                 :body,
                                 :user_id,
                                 :category)
  end
end
