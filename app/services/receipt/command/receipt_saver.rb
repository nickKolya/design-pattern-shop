module Receipt
  module Command
    class ReceiptSaver
      attr_reader :order

      def initialize(order)
        @order = order
      end

      def save_receipt

      end
    end
  end
end
