module Logging
  class PaymentsLogger < Logging::AppLogger
    def file_path
      'log/payments.log'
    end
  end
end
