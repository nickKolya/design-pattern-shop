class BaseOperation < Trailblazer::Operation
  attr_reader :alerts, :status

  def process(params)
    process_user_logic(params)
    setup_alerts!
    setup_status!
  end

  def process_user_logic(params); end

  def setup_alerts!
    @alerts = { message_type => message }.with_indifferent_access
  end

  def setup_status!
    @status = contract_errors_message.blank? ? 200 : 422
  end

  def success_message; end

  def contract_errors_message
    @errors ||= contract.errors.full_messages
  end

  def message
    contract_errors_message.blank? ? success_message : contract_errors_message
  end

  def message_type
    contract_errors_message.blank? ? 'notice' : 'alert'
  end

  def raise_error_404
    fail ActiveRecord::RecordNotFound
  end
end
