namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@class2dream.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    
    61.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    19.times do |n|
      name = "#{n+1}조"
      Team.create!(name: name)
    end
  end
end