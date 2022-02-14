FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(6, 12) }

    trait :with_searches do
      after(:build) do |user|
        user.searches << FactoryBot.create_list(:search, 2)
      end
    end
  end
end
