class Item
  class Index < Trailblazer::Operation
    def process(_params)
      @model = Item.all
    end
  end
end
