class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @pagy, @posts = pagy(Post.includes(:user).all)
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.comments.includes(:user)
    @user_likes = @post.likes.find_by(user_id: current_user.id) if current_user
    @comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = if current_user.admin?
              Post.new(post_params)
            else
              current_user.posts.build(post_params)
            end

    if @post.save
      redirect_to(post_path(@post.id))
    else
      render(:new, status: :unprocessable_entity)
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
    redirect_to(root_path)
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
