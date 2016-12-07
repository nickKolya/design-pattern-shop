class Product
  class Cell
    class New < ::Cell::Concept
      inherit_views Product::Cell
      include ActionView::Helpers::FormOptionsHelper

      def show
        @form = options[:form]
        render :new
      end
    end
  end
end
