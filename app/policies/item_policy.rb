class ItemPolicy
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def product?
    item.is_a? Product
  end

  def service?
    item.is_a? Service
  end
end
