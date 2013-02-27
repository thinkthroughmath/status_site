# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    email { Forgery(:internet).email_address }
    password 'password2'
  end
end
