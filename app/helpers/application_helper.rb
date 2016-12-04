module ApplicationHelper
  def active_tab(controller, action = nil)
    @navigation_policy ||= NavigationPolicy.new(params)
    return 'active' if @navigation_policy.active?(controller, action)
  end

  def user_policy
    @user_policy ||= UserPolicy.new(current_user)
  end

  def acting?
    cookies[:acting_token].present?
  end
end
