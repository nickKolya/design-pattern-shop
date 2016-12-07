class ServicesController < ApplicationController
  before_action :authenticate_user!, :only_admin!

  def new
    form Item::Create
    render_view :service, :new
  end

  def create
    run Item::Create do
      return redirect_to items_path, @operation.alerts
    end
    render_view :service, :new, @operation.alerts
  end
end
