class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV["PASSWORD"]
  
  def show
    @categories_count = Category.count.to_i
    @products_count = Product.count.to_i
  end
end
