class Order
  module Contract
    class Reopen < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, 'You can`n reopen order') unless model.canceled?
      end
    end
  end
end
