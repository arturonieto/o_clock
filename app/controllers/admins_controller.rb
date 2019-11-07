class AdminsController < ApplicationController
  before_action :verify_role, except: :get_time

  def get_time
    @time = Time.zone.now.strftime("%H:%M:%S ")
    render partial: "application/time"
  end

  def index
    # Time will be updated every second by get_time with an ajax request
    @time = Time.zone.now.strftime("%H:%M:%S ")
    @active_index = "active"

    @employees = Employee.where(admin_id: current_user.admin.id).order(:id)
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day

    @employees.each do |e|
      e.recorded_check_in = e.records.detect{ |r| r[:check_in] && r[:check_in].between?(start_date, end_date) }
      e.recorded_check_out = e.records.detect{ |r| r[:check_out] && r[:check_out].between?(start_date, end_date) }

      if e.recorded_check_in && e.recorded_check_in.check_in.strftime("%H:%M %P") <= e.entry_time.strftime("%H:%M %P")
        e.on_time = 1
      end
    end

  end

  def check_in
    employee = Employee.find(params[:id])
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day

    if employee.records.detect{ |r| r[:check_in] && r[:check_in].between?(start_date, end_date) }

    else
      record = Record.new(employee_id: employee.id, check_in: Time.now)
    end

    record.save!

  end


  def check_out
    employee = Employee.find(params[:id])
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day

    if employee.records.detect{ |r| r[:check_out] && r[:check_out].between?(start_date, end_date) }

    elsif !employee.records.detect{ |r| r[:check_in] && r[:check_in].between?(start_date, end_date) }

    else
      record = employee.records.detect{ |r| r[:check_in] && r[:check_in].between?(start_date, end_date) }
      record.update(check_out: Time.now)
    end

    record.save!
  end

  
  def get_records
    @employees = Employee.where(admin_id: current_user.admin.id).order(:id)
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day

    @employees.each do |e|
      e.recorded_check_in = e.records.detect{ |r| r[:check_in] && r[:check_in].between?(start_date, end_date) }
      e.recorded_check_out = e.records.detect{ |r| r[:check_out] && r[:check_out].between?(start_date, end_date) }

      if e.recorded_check_in && e.recorded_check_in.check_in.strftime("%H:%M %P") <= e.entry_time.strftime("%H:%M %P")
        e.on_time = 1
      end
    end
    render partial: "buttons_or_records"
  end

  def manage_workers
    @time = Time.zone.now.strftime("%H:%M:%S ")
    @employees = Employee.where(admin_id: current_user.admin.id).order(:id)
    @active_manage_workers = 'active'
  end

  def manage_worker_records
    @time = Time.zone.now.strftime("%H:%M:%S ")
    @current_week = Time.now.strftime("%W")
    @active_manage_workers = 'active'
    @employee = Employee.find(params[:id])

    @employee.records.each do |record|
      if record.check_in && record.check_in.strftime("%H:%M %P") <= @employee.entry_time.strftime("%H:%M %P")
        record.on_time = 1
      end
    end

    @records = @employee.records.group_by(&:week)
    @this_week_records = @employee.records.group_by(&:current_week)
    @this_week_records_true = @this_week_records[true]

  end

  def create_employee
    @time = Time.zone.now.strftime("%H:%M:%S ")
    @active_manage_workers = 'active'
    @user = User.new
  end

end
