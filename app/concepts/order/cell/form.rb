class Order
  class Cell
    class Form < Order::Cell
      include ActionView::RecordIdentifier
      include ActionView::Helpers::FormOptionsHelper

      property :contract

      def show
        render :form
      end

      def form_path
        contract.model.new_record? ? orders_path : order_path
      end

      def action_name
        contract.model.new_record? ? I18n.t('buttons.create') : I18n.t('buttons.update')
      end

      def selected_items
        params? ? params[:order][:item_ids] : contract.model.item_ids
      end

      def items_select
        labels_collection = contract.model.items.collect do |label|
          [label.name, label.id]
        end.compact.sort
        options_for_select(labels_collection, selected_items)
      end

      def params?
        params[:order].present?
      end
    end
  end
end
