class Item
  class Cell
    class Form < ::Cell::Concept
      inherit_views Item::Cell
      include ActionView::Helpers::FormOptionsHelper

      attr_reader :type, :form

      delegate :map_sub_categories, to: ItemPresenter

      def show
        @form = options[:form]
        render :form
      end
    end
  end
end
