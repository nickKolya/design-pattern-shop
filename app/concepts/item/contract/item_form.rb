class Item
  class Contract
    class ItemForm < Reform::Form
      PRICE_REGEX = /\A\d+(,\d{1,2})?\z/

      Item.attribute_names.each { |col| property col.to_sym }

      property :image

      validates :name, :description, :category_id, presence: true
      validates :price, format: PRICE_REGEX
    end
  end
end
