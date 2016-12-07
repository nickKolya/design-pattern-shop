module Receipt
  module Command
    class SendReceipt < ReceiptAction
      def execute
        receiver.send_receipt
      end
    end
  end
end
