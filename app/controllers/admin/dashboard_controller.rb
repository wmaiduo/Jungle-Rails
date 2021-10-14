class Admin::DashboardController < ApplicationController
  puts "___________________________"
  puts ENV['USERNAME']
  puts ENV["PASSWORD"]
  puts "end"

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV["PASSWORD"]
  
  def show
  end
end
