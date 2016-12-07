module Receipt
  module Builder
    class Html < Base
      attr_reader :rheader, :rbody, :rfooter

      def build_header
        @rheader = header
      end

      def build_body
        @rbody = body
      end

      def build_footer
        @rfooter = footer
      end

      def get_receipt
        wrapper do
          rheader + rbody + rfooter
        end
      end
    end
  end
end
