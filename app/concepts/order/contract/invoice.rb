class Order
  module Contract
    class Invoice < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, I18n.t('error_messages.cant_invoice')) if model.canceled? || model.invoiced?
      end
    end
  end
end
