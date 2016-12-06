class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    form Product::Create
    render_view :product, :new
  end
end
