class Order
  module Contract
    class Create < Reform::Form
      properties :user_id, :name, :description, :item_ids
      validates :name, presence: true
      validate :current_state

      def current_state
        errors.add(:order, 'You can`n create new order') if newmade?
      end

      private

      def newmade?
        model.user.orders.newmade.count >= 1
      end
    end
  end
end
