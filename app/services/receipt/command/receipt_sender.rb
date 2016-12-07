module Receipt
  module Command
    class ReceiptSender
      attr_reader :order

      def initialize(order)
        @order = order
      end

      def send_receipt

      end
    end
  end
end
