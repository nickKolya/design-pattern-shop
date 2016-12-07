class Order
  class Invoice < Trailblazer::Operation
    include Dispatch
    include Resolver
    policy Order::Policy, :access?

    include Model
    model Order, :find
    contract Contract::Invoice

    def process(params)
      validate({}) && model.invoice!
    end
  end
end
