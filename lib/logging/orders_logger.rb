module Logging
  class OrdersLogger < Logging::AppLogger
    def file_path
      'log/orders.log'
    end
  end
end
