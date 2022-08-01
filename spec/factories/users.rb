FactoryBot.define do
  factory :user do
    id {"1"}
    email { "itirou@example.com" }
    password { "itirou" }
  end

  factory :another_user, class: User do
    id {"2"}
    email { "jirou@example.com" }
    password { "@jirou" }
  end
end
