class Order
  class AddProduct < Trailblazer::Operation
    def process(params)
      return newmade_order.items << item if newmade_order.present?
      @params[:current_user].orders.create(name: 'New Order').items << item
    end

    private

    def newmade_order
      @newmade_order ||= @params[:current_user].orders.newmade.take
    end

    def item
      @item ||= Item.find(@params[:item_id])
    end
  end
end
