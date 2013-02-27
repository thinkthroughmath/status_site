# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_subscription do
    email { Forgery(:internet).email_address }
    token { SecureRandom.urlsafe_base64 }
  end
end
