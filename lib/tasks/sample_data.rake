namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
#    User.create!(name: "Example User",
#                 std_num: 2000122104,
#                 email: "example@class2dream.com",
#                 password: "foobar",
#                 password_confirmation: "foobar",
#                 admin: true)
    
#    61.times do |n|
#      name  = Faker::Name.name
#      email = "example-#{n+1}@railstutorial.org"
#      std_num = 2014122000 + n + 1
#      password  = "password"
#      User.create!(name: name,
#                   email: email,
#                   std_num: std_num,
#                   password: password,
#                   password_confirmation: password)
#    end
    
    18.times do |n|
      name = "#{n+1}조"
      Team.create!(name: name)
    end
  end
end