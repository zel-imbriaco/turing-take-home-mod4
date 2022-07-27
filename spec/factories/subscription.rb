FactoryBot.define do
  factory :subscription do
    association :title, factory: :tea
    price { Faker::Commerce.price }
    status { Faker::Subscription.status }
    frequency { Faker::Subscription.subscription_term }
    association :customer_id, factory: :customer
  end
end
