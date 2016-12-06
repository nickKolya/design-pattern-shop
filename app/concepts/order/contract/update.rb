class Order
  module Contract
    class Update < Reform::Form
      properties :user_id, :name, :description, :item_ids
      validates :name, presence: true
    end
  end
end
