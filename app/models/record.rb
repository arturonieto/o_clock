class Record < ApplicationRecord
  belongs_to :employee
  attr_accessor :on_time

  def week
    self.check_in.strftime('%W')
  end

  def day
    self.check_in.strftime('%D')
  end

  def current_week
    self.check_in.strftime('%W') == Time.now.strftime('%W')
  end

end
