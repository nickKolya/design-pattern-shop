class Order
  class Cell
    class List < Order::Cell
      def show
        render :list
      end

      def to_state
        case model.state
        when OrderStates::Newmade.to_s
          'New Order'
        when OrderStates::Canceled.to_s
          'Canceled Order'
        when OrderStates::Invoiced.to_s
          'Invoiced Order'
        end
      end

      def to_date(field)
        field.strftime('%b %d, %Y - %I:%M %P') if field.present?
      end
    end
  end
end
