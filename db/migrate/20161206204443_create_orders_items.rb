class CreateOrdersItems < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_items, id: :uuid do |t|
      t.uuid :order_id, index: true
      t.uuid :item_id, index: true

      t.timestamps null: false
    end
  end
end
