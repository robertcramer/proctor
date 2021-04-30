require 'rails_helper'

RSpec.describe UserExam, type: :model do
  # associations
  it { should belong_to(:exam) }
  it { should belong_to(:user)}
  # validations
  it { should validate_presence_of(:start_time) }
end
