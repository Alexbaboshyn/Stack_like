class Api::CategoriesController < ApplicationController

  def create
    super
    head :created
  end

  private
  def build_resource
    @category = Category.new resource_params
  end

  def resource
    @category ||= Category.find params[:id]
  end

  def collection
    @categories = Category.page(params[:page]).per(5)
  end

  def resource_params
    params.require(:category).permit(:title)
  end
end
