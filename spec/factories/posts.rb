FactoryBot.define do
  factory :post do
    title { "title" }
    body { "content" }
    association :user
  end
end
