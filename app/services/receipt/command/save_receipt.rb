module Receipt
  module Command
    class SaveReceipt < ReceiptAction
      def execute
        receiver.save_receipt
      end
    end
  end
end
