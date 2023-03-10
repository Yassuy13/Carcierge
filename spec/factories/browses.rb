FactoryBot.define do
  factory :browse do
    body { "content" }
    association :user
    association :post
  end
end
