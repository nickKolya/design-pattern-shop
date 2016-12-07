module Logging
  class AppLogger
    attr_reader :logger
    delegate :error, :info, :debug, to: :logger

    class << self
      def instance
        @instance ||= new
      end
    end

    def file_path
      'log/debug.log'
    end

    private

    def logger
      @logger ||= Logger.new(file_path)
    end
  end
end
