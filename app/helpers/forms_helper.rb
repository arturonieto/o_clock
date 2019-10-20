module FormsHelper

  def setup_user(user)
    user.employee ||= Employee.new
    user
  end

end
