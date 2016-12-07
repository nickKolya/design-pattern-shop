class Order
  module Contract
    class Cancel < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, 'You can`n cancel order') unless model.newmade?
      end
    end
  end
end
