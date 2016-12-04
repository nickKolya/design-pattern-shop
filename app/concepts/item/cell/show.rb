class Item
  class Cell
    class Show < ::Cell::Concept

      def show
        render item_show
      end

      private

      def item_show
        items_cell_show[model.type]&.new(model)&.call(:show)
      end

      def items_cell_show
        {
          Product => Product::Cell::Show,
          Service => Service::Cell::Show
        }
      end
    end
  end
end
