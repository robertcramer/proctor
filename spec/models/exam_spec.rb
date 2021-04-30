require 'rails_helper'

RSpec.describe Exam, type: :model do
  # associations
  it { should belong_to(:college) }
  it { should have_many(:user_exams) }
  it { should have_many(:users) }
  # validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end
