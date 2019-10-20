module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/' unless current_user
  end

  def logged_user
    if current_user
      redirect_to '/start'
    end
  end

  def verify_role
    if current_user
      redirect_to index_path unless current_user.allowed_role?(2)
    else
      redirect_to index_path
    end
  end
end
