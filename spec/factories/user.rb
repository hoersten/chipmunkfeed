FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password Devise.friendly_token.first(8)
  end

end
