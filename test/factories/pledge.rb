FactoryBot.define do
  factory :pledge do
    dollar_amount {3}
    user
    project
  end
end
