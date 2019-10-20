class Employee < ApplicationRecord
  belongs_to            :user
  validates_presence_of :user
  has_many              :records, dependent: :destroy
  attr_accessor :recorded_check_in, :recorded_check_out

end
