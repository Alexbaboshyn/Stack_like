class Api::PostsController < ApplicationController

  private
  def build_resource
    @post = current_user.posts.new resource_params
  end

  def resource
    @post ||= Post.find params[:id]
  end

  def collection
    @posts = Post.page(params[:page]).per(5)
  end

  def resource_params
    params.permit(:title, :description, :category_id)
  end
end
