class HomeController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @query.sorts = ['updated_at desc']
    @posts = @query.result.
      page(params[:page]).
      per(params[:per_page])
  end
end
