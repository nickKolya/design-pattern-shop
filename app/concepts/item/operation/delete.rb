class Item
  class Delete < BaseOperation
    def process_user_logic(_params)
      @model.destroy
    end

    def success_message
      I18n.t('operation.items.messages.destroyed')
    end
  end
end
