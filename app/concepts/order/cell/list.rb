class Order
  class Cell
    class List < Order::Cell
      def show
        render :list
      end
    end
  end
end
