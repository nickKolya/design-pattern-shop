module Logging
  class LoggerFactory
    LOGGERS_MAPPING = { orders: Logging::Orders, payments: Logging::Payments }.freeze

    class << self
      def fetch(key)
        LOGGERS_MAPPING[:key]&.instance
      end
    end
  end
end
