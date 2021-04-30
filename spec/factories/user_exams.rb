FactoryBot.define do
  factory :user_exam do
    start_time { DateTime.now + 21.days }
    user
    exam
  end
end
