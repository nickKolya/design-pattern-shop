class Order
  class Policy
    attr_reader :model, :current_user

    def initialize(current_user, model)
      @current_user = current_user
      @model = model
    end

    def access?
      current_user == model.user
    end
  end
end
