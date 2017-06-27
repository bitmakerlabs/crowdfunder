FactoryGirl.define do
  factory :project do
    title 'Test Project'
    description 'This is a test'
    goal 1000
    start_date 1.month.from_now
    end_date 3.months.from_now
  end
end
