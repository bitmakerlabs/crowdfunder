FactoryGirl.define do
  factory :project do
    title "test"
    description "test"
    goal 1
    start_date DateTime.now + 3600
    end_date DateTime.now + 7200
  end
end
