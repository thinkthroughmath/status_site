FactoryGirl.define do
  factory :message do
    body  { Forgery(:lorem_ipsum).words(10) }
    start_date { Date.today }
  end
end
