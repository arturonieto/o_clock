class UsersController < ApplicationController

  def create_employee
    @time = Time.now.strftime("%H:%M:%S ")
    @active_manage_workers = 'active'
    @user = User.new
  end
  def create
    user = User.new(new_user_params)
    user.id = User.maximum('id') + 1
    user.employee.id = Employee.maximum('id') + 1

    if user.save!
      redirect_to manage_workers_path
    else
      redirect_to users_path
    end

  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to '/'
    else
      redirect_to edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, employee_attributes: [:id, :first_name, :last_name, :entry_time])
  end

  def new_user_params
    params.require(:user).permit(:email, :password, :role, employee_attributes: [:first_name, :last_name, :entry_time, :admin_id])
  end

end
