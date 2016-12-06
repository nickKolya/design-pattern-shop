class Order
  class Create < Trailblazer::Operation
    include Dispatch
    include Resolver
    policy Order::Policy, :access?

    include Model
    model Order, :create
    contract Contract::Update

    def process(params)
      validate(params[:order], &:save)
    end

    private

    def setup_model!(params)
      model.user_id = params[:current_user].id
    end
  end
end
