FactoryBot.define do
  factory :user do
    first_name { "User" }
    last_name  { "Userlastname" }
    email { "user@email.com"}
    password { "password" }
    admin { false }
  end
end
