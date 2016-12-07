class AddSubCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name

      t.timestamps
    end

    create_table :sub_categories, id: :uuid do |t|
      t.uuid :category_id
      t.string  :name

      t.timestamps
    end

    add_index :sub_categories, :category_id
  end
end
