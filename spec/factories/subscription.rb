FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.variety }
    price { Faker::Commerce.price }
    status { Faker::Subscription.status }
    frequency { Faker::Subscription.subscription_term }
    association :customer_id, factory: :customer
  end
end
