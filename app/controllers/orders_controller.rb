class OrdersController < ApplicationController
  before_action :should_authenticate

  def index
    collection Order::Index
  end

  def new
    form Order::Create
    render_form
  end

  def edit
    form Order::Update
    render_form
  end

  def create
    run Order::Create do
      return redirect_to orders_path, notice: t('successfull_messages.created', model: t('activerecord.models.order'))
    end
    flash[:alert] = @operation.errors.full_messages
    render_form
  end

  def update
    run Order::Update do
      flash[:notice] = t('successfull_messages.updated', model: t('activerecord.models.order'))
    end
    flash[:alert] = @operation.errors.full_messages if @operation.errors.any?
    render_form
  end

  def destroy
    run Order::Destroy do
      return redirect_to orders_path, notice: t('successfull_messages.deleted', model: t('activerecord.models.order'))
    end
    redirect_to orders_path, alert: @operation.errors.full_messages
  end

  private

  def render_form
    render text: concept('order/cell/form', @operation), layout: true
  end
end
