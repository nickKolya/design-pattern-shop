class Product
  class Cell
    class Show < ::Cell::Concept
      inherit_views Product::Cell

      delegate :item_add_to_order_path, to: '::Rails.application.routes.url_helpers'

      delegate :price, :category_name, :name, :image, :description, to: :model

      def show
        render :show
      end
    end
  end
end
