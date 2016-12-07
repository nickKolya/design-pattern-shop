class ReceiptsController < ApplicationController
  def generate_receipt
    params = { receipt_type: :pdf }
    op = Receipt::Operation::Create.call(params)

    send_file op.path_to_receipt
  end
end
