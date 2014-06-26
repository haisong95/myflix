class CategoriesController < ApplicationController
  def show
    @category = category.find(params[:id])
  end
end
