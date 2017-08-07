FactoryGirl.define do

  factory :project_owner, class: User do
    first_name "Jane"
    sequence :email do |n|
      "#{first_name}#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
  end


  factory :user do
    first_name "John"
    sequence :email do |n|
      "#{first_name}#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
  end

  factory :pledge do
    user
    project
  end

  factory :project do
    title "Really cool project"
    description "This project is really cool"
    goal 1000000
    start_date Date.today + 1.month
    end_date Date.today + 3.months
    association :owner, factory: :project_owner, first_name: "Jane"
  end

  factory :reward do
    project
  end


end
