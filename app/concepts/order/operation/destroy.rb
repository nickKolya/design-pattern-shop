class Order
  class Destroy < Trailblazer::Operation
    include Resolver
    policy Order::Policy, :access?

    include Model
    model Order, :find

    def process(*)
      model.destroy
    end
  end
end
