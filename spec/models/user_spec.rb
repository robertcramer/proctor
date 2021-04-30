require 'rails_helper'

RSpec.describe User, type: :model do
  # associations
  it { should have_many(:user_exams) }
  it { should have_many(:exams) }
  # validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone_number) }
end
