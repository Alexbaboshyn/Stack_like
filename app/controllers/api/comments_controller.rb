class Api::CommentsController < ApplicationController

  def create
    super
    head :created
  end

  private
  def build_resource
    @comment = current_user.comments.new resource_params
  end

  def resource
    @comment ||= Comment.find params[:id]
  end

  def collection
    @comments = Comment.page(params[:page]).per(15)
  end

  def resource_params
    params.permit(:text, :post_id)
  end
end
