class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV["PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_param)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'category created'
    else
      render :new
    end
  end

  private
  
  def category_param
    params.require(:category).permit(
      :name,
      :description
    )
  end

end
