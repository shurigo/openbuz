require 'factory_girl'
# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do 
  factory :user do
    name                  "tester"
    email                 "tester@example.com"
    gender                "m"
    age                   30
    password              "Foobar123"
    password_confirmation "Foobar123"
  end
end
