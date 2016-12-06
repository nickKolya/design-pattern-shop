class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.uuid :user_id, index: true
      t.string  :state

      t.timestamps
    end
  end
end
