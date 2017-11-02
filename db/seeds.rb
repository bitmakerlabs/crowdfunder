# Pledge.destroy_all
# Reward.destroy_all
# User.destroy_all
# Project.destroy_all
#
# 10.times do
#   project = Project.create!(
#               user_id: rand(10),
#               title: Faker::App.name,
#               description: Faker::Lorem.paragraph,
#               goal: rand(100000),
#               start_date: Time.now.utc,
#               end_date: Time.now.utc + rand(80).days
#             )
#
#   5.times do
#     project.rewards.create!(
#       description: Faker::Superhero.power,
#       dollar_amount: rand(1..100),
#     )
#   end
# end
#
# 5.times do
#   User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.free_email,
#     password: 'password',
#     password_confirmation: 'password'
#   )
# end
#
# 20.times do
#   project = Project.all.sample
#
#   Pledge.create!(
#     user: User.all.sample,
#     project: project,
#     dollar_amount: project.rewards.sample.dollar_amount + rand(10)
#   )
# end


50.times do
  Update.create!(
    note: "this is a random note. Very nice",
    project_id: rand(17..30)
  )
end
