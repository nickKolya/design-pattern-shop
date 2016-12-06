class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, alert: t('error_messages.record_not_found')
  end

  private

  def only_admin!
    render_404 unless UserPolicy.new(params[:current_user]).admin?
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.json { render json: { status: 404 } }
    end
  end

  def render_view(controller, action, options = {})
    flash.now.alert = options[:alert] if options[:alert]
    flash.now.notice = options[:notice] if options[:notice]
    render text: concept("#{controller}/cell/#{action}",
                         options.fetch(:model, @model),
                         render_options),
           layout: options.fetch(:layout, true)
  end

  def render_options
    {
      form: @form
    }
  end

  def process_params!(params)
    params[:current_user] = current_user
  end

  def should_authenticate
    redirect_to root_path, alert: t('devise_views.signin.header') unless user_signed_in?
  end
end
