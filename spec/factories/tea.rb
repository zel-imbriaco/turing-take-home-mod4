FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    temperature { Faker::Number.decimal_part(digits: 2) }
    brew_time { Faker::Number.decimal_part(digits: 2) }
  end
end
