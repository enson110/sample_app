FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person_#{n}" }
    sequence(:email) { |n| "Person_#{n}@person.com" }
    password "gaofeng"
    password_confirmation "gaofeng"

    factory :admin do
    	admin true
    end
  end
end
