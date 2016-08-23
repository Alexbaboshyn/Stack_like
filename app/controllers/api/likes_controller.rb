class Api::LikesController < ApplicationController

  def create
    super
    head :created
  end

  private

  def parent
    return @parent if @parent
    if params[:post_id]
      @parent = Post.find(params[:post_id])
    else
      @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    end
  end

  def build_resource
    @like = parent.likes.build(resource_params.merge(user: current_user))
  end

  def resource
    @like ||= parent.likes.find_by!(user_id: current_user.id)
  end

  def resource_params
    params.require(:like).permit(:kind)
  end
end
