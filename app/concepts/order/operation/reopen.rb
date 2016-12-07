class Order
  class Reopen < Trailblazer::Operation
    include Dispatch
    include Resolver
    policy Order::Policy, :access?

    include Model
    model Order, :find
    contract Contract::Reopen

    def process(params)
      validate({}) && model.reopen!
    end
  end
end
