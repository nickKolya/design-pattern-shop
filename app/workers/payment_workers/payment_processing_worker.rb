module PaymentWorkers
  class PaymentProcessingWorker
    include Sidekiq::Worker

    def perform(payment_id)
    end
  end
end
