module Receipt
	module Command
    class ReceiptAction
      attr_reader :receiver

      def initialize(receiver)
        @receiver = receiver
      end

      def execute
        fail NotImplementedError
      end
    end
	end
end
