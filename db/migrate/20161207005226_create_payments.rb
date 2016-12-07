class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.uuid    :order_id, null: false, index: true, foreign_key: true
      t.integer :status,   null: false, default: 0, limit: 1
      t.jsonb   :data,     null: false, default: {}

      t.timestamps null: false
    end
  end
end
