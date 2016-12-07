module Receipt
  class BuilderFetcher
    RECEIPT_TYPES = [
      HTML_TYPE = 'html'.freeze,
      PDF_TYPE = 'pdf'.freeze
    ]

    attr_reader :receipt_type

    def self.perform(args = {})
      new(args).perform
    end

    def initialize(args)
      @receipt_type = args.fetch(:receipt_type, HTML_TYPE).to_s.downcase
    end

    def perform
      return Builder::Html unless RECEIPT_TYPES.include? receipt_type
      "Receipt::Builder::#{receipt_type.titleize}".constantize
    end
  end
end
