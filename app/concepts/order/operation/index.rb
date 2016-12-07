class Order
  class Index < Trailblazer::Operation
    def model!(params)
      params[:current_user].orders
    end
  end
end
