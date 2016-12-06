class Product
  class Cell
    class Show < ::Cell::Concept
      inherit_views Product::Cell

      def show
        render :show
      end
    end
  end
end
