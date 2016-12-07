require_relative File.expand_path('../../../main/operation/base_operation', __FILE__)

class Item
  class Create < ::BaseOperation
    include Model
    model ::Product, :create

    contract Contract::ItemForm

    def process_user_logic(params)
      validate(params_form, &:save)
    end

    def success_message
      I18n.t('operation.items.messages.created')
    end

    def params_form
      @params[:product]&.merge(type: @params[:type])
    end
  end
end
