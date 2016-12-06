class Item
  module Contract
    module ItemForm
      include Reform::Form::Module

      Item.attribute_names.each { |col| property col.to_sym }

      property :image

      validates :name, :description, :category, presence: true
    end
  end
end
