class AddOrderIdToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :order_id, :integer
    add_index  :items, :order_id
  end
end
