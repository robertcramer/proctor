require 'rails_helper'

RSpec.describe College, type: :model do
  # associations
  it { should have_many(:exams) }
  it { should have_many(:user_exams) }
  # validations
  it { should validate_presence_of(:name) }
end
