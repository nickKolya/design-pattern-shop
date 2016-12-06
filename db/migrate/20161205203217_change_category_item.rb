class ChangeCategoryItem < ActiveRecord::Migration[5.0]
  def up
    remove_column :items, :category, :string
    add_column :items, :category_id, :integer
  end

  def down
    remove_column :items, :category_id, :integer
    add_column :items, :category, :string
  end
end
