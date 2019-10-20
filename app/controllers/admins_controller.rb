class AdminsController < ApplicationController
  before_action :verify_role

  def get_time
    @time = Time.now.strftime("%H:%M:%S ")
    #e.recorded_check_in.check_in.strftime("%H:%M %P")
    #render partial: "date"
  end

  def index
    # Time will render partially in the header every second
    @time = Time.now.strftime("%H:%M:%S ")


    @employees = Employee.order(:id)
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day

    @employees.each do |e|
      e.recorded_check_in = e.records.detect{ |r| r[:check_in] and r[:check_in].between?(start_date, end_date) }
      e.recorded_check_out = e.records.detect{ |r| r[:check_out] and r[:check_out].between?(start_date, end_date) }
      #p b_movies=movies.select{|movie| movie[:title].downcase.include?("b")}.map{|movie| movie[:id]}
      #e.recorded = 1 if e.records.
      #e.records.select { |r| r.check_in.between?(start_date, end_date) }.any? ? e.recorded = 1 : e.recorded = 0
      #e.recorded = 1 if e.records(:check_in).between?(star_date, end_date).any?
      #@selected_records = Array.new
      #@selected_records.push( e.records.where(check_in >= @start_date and r.check_in < end_date))#.find { |r| r.check_in >= start_date && r.check_in < end_date }
      #found = array.select {|e| e == 3}
      #e.get_today_records
      #today == ChristmasEve ? (puts "Santa's On His Way!") : (puts "Snow")
      #record = Record.where(where_string, e.id, start_date, end_date)
      #record = Record.where('employee_id = ? and check_in >= ? and check_in < ?', e.id, Date.current.beginning_of_day, Date.current.beginning_of_day + 1.day).any?
      #record ? e.check_in_today = 1 : e.check_in_today = 0
      #if Record.where(where_string, e.id, start_date, end_date)#.any?
      #  e.check_in_today = 1
      #else
      #  e.check_in_today
    end

    #render partial: "buttons_or_records"
    # Hay que cambiar todo el loop al buttons and records
    #respond_to do |format|
    #  format.js
    #end
  end

  def check_in
    employee = Employee.find(params[:id])
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day
    #@employee_id = 0
    #@record_check_in_time = 0

    if employee.records.detect{ |r| r[:check_in].between?(start_date, end_date) }
      #render partial: "buttons_or_records"
    else
      record = Record.new(employee_id: employee.id, check_in: Time.now)
      if record.save!
        #redirect_back
        #@employee_id = employee.id
        #@record_check_in_time = record.check_in.strftime("%H:%M %P")
        #if employee.entry_time > record.check_in.time
        #  @on_time = 1
        #end
        #self.get_record_time
        #@employees = Employee.order(:id)
        #start_date = Date.today.beginning_of_day
        #end_date = Date.today.beginning_of_day + 1.day

        #@employees.each do |e|
          #e.recorded_check_in = e.records.detect{ |r| r[:check_in] and r[:check_in].between?(start_date, end_date) }
          #e.recorded_check_out = e.records.detect{ |r| r[:check_out] and r[:check_out].between?(start_date, end_date) }
          #p b_movies=movies.select{|movie| movie[:title].downcase.include?("b")}.map{|movie| movie[:id]}
          #e.recorded = 1 if e.records.
          #e.records.select { |r| r.check_in.between?(start_date, end_date) }.any? ? e.recorded = 1 : e.recorded = 0
          #e.recorded = 1 if e.records(:check_in).between?(star_date, end_date).any?
          #@selected_records = Array.new
          #@selected_records.push( e.records.where(check_in >= @start_date and r.check_in < end_date))#.find { |r| r.check_in >= start_date && r.check_in < end_date }
          #found = array.select {|e| e == 3}
          #e.get_today_records
          #today == ChristmasEve ? (puts "Santa's On His Way!") : (puts "Snow")
          #record = Record.where(where_string, e.id, start_date, end_date)
          #record = Record.where('employee_id = ? and check_in >= ? and check_in < ?', e.id, Date.current.beginning_of_day, Date.current.beginning_of_day + 1.day).any?
          #record ? e.check_in_today = 1 : e.check_in_today = 0
          #if Record.where(where_string, e.id, start_date, end_date)#.any?
          #  e.check_in_today = 1
          #else
          #  e.check_in_today
        #end
        #render partial: "buttons_or_records"
        #return true
        #respond_to do |format|
        #  format.js
          #format.coffeescript
        #end
        #return render html: "buttons_or_records"
        #reload
        #return true
        #render partial: "buttons_or_records"
        #redirect_to 'admin/index'
        #redirect_to render partial: "buttons_or_records"

      end
    end
  end


  def check_out
    employee = Employee.find(params[:id])
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day
    #@employee_id = 0
    #@record_check_out_time = 0
    #employee.records.detect{ |r| r[:check_in].between?(start_date, end_date) }
    if employee.records.detect{ |r| r[:check_out] and r[:check_out].between?(start_date, end_date) }
      #render partial: "buttons_or_records"
      #return
    elsif !employee.records.detect{ |r| r[:check_in] and r[:check_in].between?(start_date, end_date) }
      #return
    else
      record = Record.new(employee_id: employee.id, check_out: Time.now)
      #if record.save!
        #@employee_id = employee.id
        #@record_check_out_time = record.check_out.strftime("%H:%M %P")
        #self.get_record_time
        #self.get_button_or_record

        #respond_to do |format|
        #  format.js
        #end

      #end
    end

    if record.save!
    end

  end
=begin
  def get_button_or_record
    @employees = Employee.order(:id)
    start_date = Date.today.beginning_of_day
    end_date = Date.today.beginning_of_day + 1.day

    @employees.each do |e|
      e.recorded_check_in = e.records.detect{ |r| r[:check_in] and r[:check_in].between?(start_date, end_date) }
      e.recorded_check_out = e.records.detect{ |r| r[:check_out] and r[:check_out].between?(start_date, end_date) }
      #p b_movies=movies.select{|movie| movie[:title].downcase.include?("b")}.map{|movie| movie[:id]}
      #e.recorded = 1 if e.records.
      #e.records.select { |r| r.check_in.between?(start_date, end_date) }.any? ? e.recorded = 1 : e.recorded = 0
      #e.recorded = 1 if e.records(:check_in).between?(star_date, end_date).any?
      #@selected_records = Array.new
      #@selected_records.push( e.records.where(check_in >= @start_date and r.check_in < end_date))#.find { |r| r.check_in >= start_date && r.check_in < end_date }
      #found = array.select {|e| e == 3}
      #e.get_today_records
      #today == ChristmasEve ? (puts "Santa's On His Way!") : (puts "Snow")
      #record = Record.where(where_string, e.id, start_date, end_date)
      #record = Record.where('employee_id = ? and check_in >= ? and check_in < ?', e.id, Date.current.beginning_of_day, Date.current.beginning_of_day + 1.day).any?
      #record ? e.check_in_today = 1 : e.check_in_today = 0
      #if Record.where(where_string, e.id, start_date, end_date)#.any?
      #  e.check_in_today = 1
      #else
      #  e.check_in_today
    end
    render partial: "buttons_or_records"
  end
=end

  #def check_out
  #end

  def get_time
    @time = Time.now.strftime("%H:%M:%S ")
    #e.recorded_check_in.check_in.strftime("%H:%M %P")
    #render partial: "date"
  end

end
