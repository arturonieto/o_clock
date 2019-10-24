class EmployeesController < ApplicationController

  def index
    @time = Time.now.strftime("%H:%M:%S ")
    @current_week = Time.now.strftime("%W")
    @active_manage_workers = 'active'
    @employee = Employee.find(current_user.employee.id)

    @employee.records.each do |record|
      if record.check_in and record.check_in.strftime("%H:%M %P") <= @employee.entry_time.strftime("%H:%M %P")
        record.on_time = 1
      end
    end

    @records = @employee.records.group_by(&:week)
    @this_week_records = @employee.records.group_by(&:current_week)
    @this_week_records_true = @this_week_records[true]
  end

end
