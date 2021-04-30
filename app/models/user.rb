class User < ApplicationRecord
  has_many :user_exams
  has_many :exams, through: :user_exams

  validates_presence_of :first_name, :last_name, :phone_number
end
