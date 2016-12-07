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
        File.open(file_path, 'w+') { |f| f.write(wrap_receipt) }
        file_path
      end

      protected

      def file_type
        :html
      end
    end
  end
end
