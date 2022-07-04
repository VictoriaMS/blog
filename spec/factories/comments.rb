FactoryBot.define do
  factory :comment do
    sequence(:body)  { |n| "Body comment number #{n}" }
    post
    user
  end
end
