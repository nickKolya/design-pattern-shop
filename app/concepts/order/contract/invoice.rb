class Order
  module Contract
    class Invoice < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, 'You can`n invoice order') if model.canceled? || model.invoiced?
      end
    end
  end
end
