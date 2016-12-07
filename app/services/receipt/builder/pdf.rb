module Receipt
  module Builder
    class Pdf < Base
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
        pdf = PDFKit.new(wrap_receipt)
        pdf.to_file(file_path).path
      end

      protected

      def file_path
        File.expand_path("#{Rails.root}/public/#{SecureRandom.hex(8)}.pdf", __FILE__)
      end

      def logo_path
        binding.pry
        "#{Rails.root}/app/assets/images/#{super}"
      end
    end
  end
end
