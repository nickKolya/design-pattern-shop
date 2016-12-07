class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    run Payment::Create do
      redirect_to(:home, notice: 'Payment Created Successfully. We will contact u. Buy & Smile ;)') and return
      logger.info("Payment Created! Data: #{params}")
    end
    redirect_to(:home, alert: 'Sorry but something went wrong with payment performing. We contact u as soon as possible to resolve this issue')
    logger.error("Payment Error! Data: #{params}")
  end

  private

  def process_params!(params)
    params.merge!(current_user: current_user)
  end

  def logger
    @logger ||= ::Logging::LoggerFactory.fetch(:payments)
  end
end
