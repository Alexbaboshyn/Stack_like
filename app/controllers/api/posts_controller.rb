class Api::PostsController < ApplicationController



  private

  def parent
    @parent ||= Category.find(params[:category_id])
  end

  def build_resource
    @post = parent.posts.build(resource_params.merge(author: current_user))
  end

  def resource
    @post ||= Post.find params[:id]
  end

  def collection
    @posts = Post.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:post).permit(:title, :description)
  end
end
