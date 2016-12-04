class Product
  class Contract
    class ProductForm < Reform::Form
      include Item::Contract::ItemForm

      property :type, default: Product
    end
  end
end
