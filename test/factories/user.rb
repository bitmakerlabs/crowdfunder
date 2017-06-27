FactoryGirl.define do
  factory :user do
    password 12345678
    password_confirmation true
    email { "#{first_name}#{id}@#{last_name}.com"  }
  end
end
