FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    uid { Faker::Alphanumeric.alpha(number: 10) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end
