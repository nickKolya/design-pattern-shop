class OrdersController < ApplicationController
  before_action :should_authenticate
  before_action :set_order, only: [:clone, :copy]

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

  def cancel
    run Order::Cancel do
      return redirect_to orders_path, notice: t('successfull_messages.updated', model: t('activerecord.models.order'))
    end
    redirect_to orders_path, alert: @operation.errors.full_messages
  end

  def reopen
    run Order::Reopen do
      return redirect_to orders_path, notice: t('successfull_messages.updated', model: t('activerecord.models.order'))
    end
    redirect_to orders_path, alert: @operation.errors.full_messages
  end

  def invoice
    run Order::Invoice do
      return redirect_to orders_path, notice: t('successfull_messages.updated', model: t('activerecord.models.order'))
    end
    redirect_to orders_path, alert: @operation.errors.full_messages
  end

  def clone
    OrderPrototype::DupPrototype.new(@order).clone
    redirect_to orders_path, notice: t('successfull_messages.created', model: t('activerecord.models.order'))
  end

  def copy
    OrderPrototype::InformationPrototype.new(@order).clone
    redirect_to orders_path, notice: t('successfull_messages.created', model: t('activerecord.models.order'))
  end

  def add_to_order
    process_params!(params)
    run Order::AddProduct
    redirect_to items_path, notice: t('successfull_messages.added', model: t('activerecord.models.item'))
  end

  private

  def render_form
    render text: concept('order/cell/form', @operation), layout: true
  end

  def set_order
    @order ||= current_user.orders.find(params[:id])
  end
end
