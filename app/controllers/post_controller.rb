class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @query = Post.ransack(params[:q])
    @query.sorts = ['updated_at desc']
    @pagy, @posts = pagy(@query.result)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

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
