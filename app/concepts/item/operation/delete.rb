require_relative File.expand_path('../../../main/operation/base_operation', __FILE__)

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
