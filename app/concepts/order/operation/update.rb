class Order
  class Update < Trailblazer::Operation
    include Dispatch
    include Resolver
    policy Order::Policy, :access?

    include Model
    model Order, :update
    contract Contract::Update

    def process(params)
      validate(params[:order], &:save)
    end
  end
end
