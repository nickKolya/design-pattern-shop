class Order
  module Contract
    class Reopen < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, I18n.t('error_messages.cant_reopen')) unless can_reopen?
      end

      private

      def can_reopen?
        model.canceled? || !model.user.orders.newmade.take.present?
      end
    end
  end
end
