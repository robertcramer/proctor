class Exam < ApplicationRecord
  belongs_to :college
  has_many :user_exams
  has_many :users, through: :user_exams

  validates_presence_of :name, :start_time, :end_time
end
