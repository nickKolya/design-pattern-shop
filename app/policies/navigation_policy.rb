class NavigationPolicy
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def active?(controller, action = nil)
    controller.is_a?(Array) ? check_controller_by_array(controller) : check_controller(controller, action)
  end

  def check_controller(controller, action = nil)
    controller?(controller) && (!action || action?(action))
  end

  def check_controller_by_array(controller_options)
    !controller_options.each { |item| return true if check_controller(item[0], item[1]) }
  end

  def controller?(*controller)
    controller.flatten.include?(params[:controller])
  end

  def action?(action)
    action.include?(params[:action])
  end
end
