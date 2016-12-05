class DevisePolicy
  attr_reader :controller_name, :resource_class, :devise_mapping

  def initialize(controller_name, resource_class, devise_mapping)
    @controller_name = controller_name
    @resource_class = resource_class
    @devise_mapping = devise_mapping
  end

  def not_sessions?
    controller_name != 'sessions'
  end

  def not_registrations?
    devise_mapping.registerable? && controller_name != 'registrations'
  end

  def recoverable?
    devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
  end

  def confirmable?
    devise_mapping.confirmable? && controller_name != 'confirmations'
  end

  def lockable?
    devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
  end

  def devise_omniauthable?
    devise_mapping.omniauthable?
  end
end
