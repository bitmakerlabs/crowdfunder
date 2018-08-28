FactoryBot.define do
  factory :project do
    sequence(:title) {|num| "Project #{num}"}
    sequence(:description) {|num| "Description #{num}"}
    goal {3000}
    start_date {Time.now.est}
    end_date {Time.now + 1.month}
    user
  end
end
