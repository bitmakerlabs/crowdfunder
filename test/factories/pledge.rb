FactoryGirl.define do
  factory :pledge do
    dollar_amount (1..10000).to_a.sample
    user User.first
  end
end
