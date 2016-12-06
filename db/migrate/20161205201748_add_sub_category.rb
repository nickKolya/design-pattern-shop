class AddSubCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :sub_categories do |t|
      t.integer :category_id
      t.string  :name

      t.timestamps
    end

    add_index :sub_categories, :category_id
  end
end
