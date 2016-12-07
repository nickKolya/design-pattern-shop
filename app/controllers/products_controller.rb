class ProductsController < ApplicationController
  before_action :authenticate_user!, :only_admin!

  def new
    form Item::Create
    render_view :product, :new
  end

  def create
    run Item::Create do
      return redirect_to items_path, @operation.alerts
    end
    render_view :product, :new, @operation.alerts
  end
end
