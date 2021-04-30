FactoryBot.define do
  factory :exam do
    name { Faker::Lorem.word }
    start_time { DateTime.now + 20.days }
    end_time { DateTime.now + 22.days }
    college
  end
end
