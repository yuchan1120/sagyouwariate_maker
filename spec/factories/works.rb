FactoryBot.define do
  factory :work do
    name { '仮点検' }
    time_required { '10' }

    trait :invalid do
      name { nil }
    end
  end

  factory :sample_work, class: Work do
    name { 'サンプルワーク' }
    time_required { '10' }
    default_data { true }
  end
end
