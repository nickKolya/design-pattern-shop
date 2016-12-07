class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    run Item::Create
    render_view :index
  end

  def destroy
    form Item::Delete
    render json: @operation.alers, status: @operation.status
  end

  def index
    run Item::Index
    render_view :item, :index
  end
end
