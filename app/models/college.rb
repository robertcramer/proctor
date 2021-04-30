class College < ApplicationRecord
  has_many :exams
  has_many :user_exams, through: :exams

  validates_presence_of :name
end
