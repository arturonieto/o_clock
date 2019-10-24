class EmployeesController < ApplicationController
=begin
  def create
    user = User.new(new_user_params)
    user.id = User.maximum('id') + 1
    user.employee.id = Employee.maximum('id') + 1

    if user.save!
      redirect_to index_path
    else
      redirect_to 'show/new'
    end

  end
=end

  def new_user_params
    params.require(:user).permit(:email, :password, :role, employee_attributes: [:first_name, :last_name])
  end

end
