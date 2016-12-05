class Product
  class Cell < ::Cell::Concept
    include ::Cell::Haml

    def show
      render
    end
  end
end
