class ServicesController < ApplicationController
  before_action :authenticate_user!, :only_admin!

  def new
    form Service::Form
    render_view :services, :new
  end
end
