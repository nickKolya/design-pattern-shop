class Product
  class Cell
    class Show < ::Cell::Concept
      inherit_views Product::Cell

      delegate :price, :category_name, :name, :image, :description, to: :model

      def show
        render :show
      end
    end
  end
end
