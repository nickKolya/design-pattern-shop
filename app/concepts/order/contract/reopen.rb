class Order
  module Contract
    class Reopen < Reform::Form
      validate :current_state

      def current_state
        errors.add(:order, 'You can`n reopen order') unless can_reopen?
      end

      private

      def can_reopen?
        model.canceled? || !model.user.orders.newmade.take.present?
      end
    end
  end
end
