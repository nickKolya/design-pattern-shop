class Payment
  class Create < ::BaseOperation
    include Model
    model ::Payment, :create

    contract do
      property :order, validates: { presence: true }
      property :data
    end

    def process_user_logic(params)
      validate(params) do
        contract.save
        process_payment
      end
    end

    def success_message
      'Payment Created Successfully'
    end

    private

    def process_payment

    end
  end
end
