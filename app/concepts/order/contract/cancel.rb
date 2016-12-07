class Order
  module Contract
    class Cancel < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, I18n.t('error_messages.cant_cancel')) unless model.newmade?
      end
    end
  end
end
