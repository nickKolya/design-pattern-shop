require_relative File.expand_path('../../../main/operation/base_operation', __FILE__)

module Receipt
  module Operation
    class Create < ::BaseOperation
      delegate :build_header, :build_body, :build_footer,
        :get_receipt, to: :builder_fetcher

      attr_reader :path_to_receipt

      def process(params)
        @path_to_receipt = generate_receipt!
      end

      private

      def generate_receipt!
        build_header
        build_body
        build_footer
        get_receipt
      end

      def builder_fetcher
        @builder_fetcher ||= Receipt::BuilderFetcher.perform(@params).new
      end
    end
  end
end
