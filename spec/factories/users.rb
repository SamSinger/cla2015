# Read about factories at https://github.com/thoughtbot/factory_girl
# require 'faker'

# FactoryGirl.define do
#   factories :user 
# end

# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "John"
    middle_name "Steven"
    last_name  "Doe"
    

    #admin false
  end
end
