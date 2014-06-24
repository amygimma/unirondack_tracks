class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all.order(:name)
  end
end
