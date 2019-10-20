class UsersController < ApplicationController



  private

  def user_params
    params.require(:user).permit(:id, :email, employee_attributes: [:id, :first_name, :last_name])
  end

  def new_user_params
    params.require(:user).permit(:email, :password, :role, employee_attributes: [:first_name, :last_name])
  end

end
