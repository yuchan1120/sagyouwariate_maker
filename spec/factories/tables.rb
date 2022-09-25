FactoryBot.define do
  factory :table do
    title { '新しい作業割当' }
  end

  factory :sample_table, class: Table do
    title { 'サンプルデータ' }
    default_data { true }
  end
end
