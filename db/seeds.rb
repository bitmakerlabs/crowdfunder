# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pledge.destroy_all
Reward.destroy_all
User.destroy_all
Project.destroy_all
Category.destroy_all

10.times do
  Category.create!(
  category: Faker::Lorem.word,
  )
end

25.times do
  p = Project.create!(
    title: Faker::App.name,
    description: Faker::Lorem.paragraph,
    goal: rand(100000),
    start_date: Time.now.utc + rand(5).days,
    end_date: Time.now.utc + rand(5..30).days
  )
 5.times do
   p.rewards.create!(
     description: Faker::Superhero.power,
     dollar_amount: rand(100) + 1,
     quantity: rand(250) + 1
   )
 end
 p.categories << Category.all.sample
end

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.times do
  r = Reward.all.sample
  Pledge.create!(
    user: User.all.sample,
    reward: r,
    dollar_amount: r.dollar_amount + rand(10)
  )
end
