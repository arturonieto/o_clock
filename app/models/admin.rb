class Admin < ApplicationRecord
  belongs_to            :user
  has_many              :employees, dependent: :destroy
  validates_presence_of :user
end
