class SessionsController < ApplicationController
before_action :logged_user , only:   [:index, :create]
before_action :require_user, except: [:index, :create, :logout]

  def index
  end

  def create
    if user = User.find_by_email(params[:email].downcase)
      if user.authenticate(params[:password])
        log_in user
        redirect_to '/start'
      end
    end

    redirect_to '/'
    flash[:invalid_login] = ".::Tus contraseña o tu email no coinciden::."
  end

  def start
    if current_user.allowed_role?(2)
      redirect_to admin_index_path
    else
      redirect_to employee_index_path
    end
  end


  def logout
    session[:user_id] = nil
    redirect_to index_path
  end

end
