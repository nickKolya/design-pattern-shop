require_relative File.expand_path('../../../main/operation/base_operation', __FILE__)

class Product
  class Create < ::BaseOperation
    include Model
    model ::Product, :create

    contract Contract::ProductForm

    def process_user_logic(params)
      validate(params, &:save)
    end

    def success_message
    end
  end
end
