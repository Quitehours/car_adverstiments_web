require 'rails_helper'

FFAKER_PASSWORD_FROM = 6
FFAKER_PASSWORD_TO = 12
USER_SEARCHES = 5

FactoryBot.define do
  create_password = FFaker::Internet.password(FFAKER_PASSWORD_FROM, FFAKER_PASSWORD_TO)
  factory :user do
    email { FFaker::Internet.email }
    password { create_password }
    password_confirmation { create_password }

    trait :with_searches do
      after(:build) do |user|
        user.searches << FactoryBot.create_list(:search, USER_SEARCHES)
      end
    end
  end
end
