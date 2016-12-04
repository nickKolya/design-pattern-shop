class CreateItems < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'

    create_table :items, id: :uuid do |t|
      t.string :name
      t.float :price
      t.string :type
      t.string :description
      t.datetime :launch_date
      t.string :location
      t.string :category
      t.timestamps
    end

    add_attachment :items, :image
  end
end
