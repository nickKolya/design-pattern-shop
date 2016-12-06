class RemoveOrderIdFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :order_id, :integer
  end
end
