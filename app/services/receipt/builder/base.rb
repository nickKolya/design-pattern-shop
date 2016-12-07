module Receipt
  module Builder
    class Base
      delegate :header, :body, :footer, :wrapper, to: :receipt_view

      def build_header
        fail NotImplementedError
      end

      def build_body
        fail NotImplementedError
      end

      def build_footer
        fail NotImplementedError
      end

      def get_receipt
        fail NotImplementedError
      end

      protected

      def wrap_receipt
        wrapper do
          rheader + rbody + rfooter
        end
      end

      def file_path
        @file_path ||=
          File.expand_path("#{Rails.root}/public/receipts/#{SecureRandom.hex(8)}.#{file_type}", __FILE__)
      end

      def logo_path
        'logo.png'
      end

      def file_type
        fail NotImplementedError
      end

      def receipt_view
        @receipt_view ||= Receipt::Cell::Html.new(logo_path: logo_path)
      end
    end
  end
end
