class Payment
  class Create < ::BaseOperation
    STRIPE_PARAM_PREFIX = 'stripe'

    include Model
    model ::Payment, :create

    contract do
      property :order_id

      # def order_should_be_valid?
      #   Order.find(model.order_id).user == current_user
      # end
    end

    def params!(params)
      params.to_unsafe_h
    end

    def process_user_logic(params)
      validate(params) do
        model.data = { payment: fetch_payment_data(params) }
        contract.save
        process_payment
      end
    end

    def success_message
      'Payment Created Successfully'
    end

    private

    def process_payment
      # ::PaymentWorkers::PaymentProcessingWorker.perform_async(model.id)
    end

    def fetch_payment_data(params)
      params.stringify_keys.select { |k, _| k.starts_with?(STRIPE_PARAM_PREFIX) }
    end
  end
end
