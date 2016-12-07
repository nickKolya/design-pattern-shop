class OrdersController < ApplicationController
  def show_to_pay
    render :pay
  end

  def pay
    render :welcome
  end
end
