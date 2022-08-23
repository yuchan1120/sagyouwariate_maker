FactoryBot.define do
  factory :user do
    name { '一郎' }
    email { 'itirou@example.com' }
    password { 'itirou' }
  end

  factory :another_user, class: User do
    name { '二郎' }
    email { 'jirou@example.com' }
    password { '@jirou' }
  end
end
