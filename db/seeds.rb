# Create some Exams which will create Colleges too w/ no user_exams yet
10.times do
  FactoryBot.create(:exam)
end

# Create some Users with no user exams yet
10.times do
  FactoryBot.create(:user)
end

# Create User Exams which will create users, exams, and colleges
10.times do
  FactoryBot.create(:user_exam)
end
