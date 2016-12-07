class Order
  class Cell < ::Cell::Concept
    include ::Cell::Haml

    property :name, :description, :state, :created_at

    def persisted?
      contract.model.persisted?
    end
  end
end
