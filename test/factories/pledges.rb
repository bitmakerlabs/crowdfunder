FactoryBot.define do
  factory :pledge do
    user
    project
    dollar_amount 100
  end
end
