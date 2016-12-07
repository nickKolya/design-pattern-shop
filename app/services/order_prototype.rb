module OrderPrototype
  class PrototypeBase
    def clone
      raise NotImpelementedError
    end
  end

  class DupPrototype < PrototypeBase
    attr_reader :model

    def initialize(model)
      @model = model
    end

    def clone
      new_model = model.dup_with_relations
      new_model.name = new_model.name + ' Cloned'
      new_model.state = 'OrderStates::Canceled'
      new_model.save
    end
  end

  class InformationPrototype < PrototypeBase
    attr_reader :model

    def initialize(model)
      @model = model
    end

    def clone
      new_model = model.dup
      new_model.name = new_model.name + ' Copied Info'
      new_model.state = 'OrderStates::Canceled'
      new_model.save
    end
  end
end
