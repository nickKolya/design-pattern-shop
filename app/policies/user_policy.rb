class UserPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def admin?
    user && user.role == User::ADMIN
  end
end
