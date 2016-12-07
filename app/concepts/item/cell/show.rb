class Item
  class Cell
    class Show < ::Cell::Concept

      def show
        items_cell_show[model.type]&.new(model)&.call(:show)
      end

      private

      def items_cell_show
        {
          ::Item::PRODUCT => Product::Cell::Show,
          ::Item::SERVICE => Service::Cell::Show
        }
      end
    end
  end
end
