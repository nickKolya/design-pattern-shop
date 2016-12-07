module OrderStates
  class StateBase < StatePattern::State
    def cancel!; end

    def invoice!; end

    def reopen!; end
  end

  class Newmade < StateBase
    def cancel!
      transition_to(Canceled)
      stateful.save!
    end

    def invoice!
      transition_to(Invoiced)
      stateful.save!
    end
  end

  class Canceled < StateBase
    def reopen!
      transition_to(Newmade)
      stateful.save!
    end
  end

  class Invoiced < StateBase
  end
end
