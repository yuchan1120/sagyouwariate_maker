FactoryBot.define do
  factory :regular_work, class: Taxon do
    id { 1 }
    name { '定時業務' }
  end

  factory :deliver_work, class: Taxon do
    id { 2 }
    name { '納品業務' }
  end

  factory :product_management_work, class: Taxon do
    id { 3 }
    name { '商品管理業務' }
  end

  factory :cleaning_work, class: Taxon do
    id { 4 }
    name { '清掃業務' }
  end
end
