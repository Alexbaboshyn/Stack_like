class Api::CategoriesController < ApplicationController


  private

  def resource
    @category = Category.find params[:id]
  end

  def collection
    @categories = Category.page(params[:page]).per(5)
  end

end
