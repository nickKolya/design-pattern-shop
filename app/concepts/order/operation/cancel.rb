class Order
  class Cancel < Trailblazer::Operation
    include Dispatch
    include Resolver
    policy Order::Policy, :access?

    include Model
    model Order, :find
    contract Contract::Cancel

    def process(params)
      validate({}) && model.cancel!
    end
  end
end
