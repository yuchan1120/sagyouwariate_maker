FactoryBot.define do
  factory :user do
    email { "itirou@example.com" }
    password { "itirou" }
  end

  factory :another_user, class: User do
    email { "jirou@example.com" }
    password { "@jirou" }
  end
end
