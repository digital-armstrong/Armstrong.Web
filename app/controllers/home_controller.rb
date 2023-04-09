class HomeController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @query.sorts = ['updated_at desc']
    @pagy, @posts = pagy @query.result
  end
end
