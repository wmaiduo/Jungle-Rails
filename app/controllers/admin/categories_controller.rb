class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV["PASSWORD"]

  def index
    @categories = Category.order(id: :DESC).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)

    if @category.save
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
