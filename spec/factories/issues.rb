FactoryGirl.define do
  factory :issue do
    title { Forgery(:basic).text }
    body  { Forgery(:lorem_ipsum).words(10) }
  end
end
