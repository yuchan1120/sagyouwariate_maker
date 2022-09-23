TAXON_NAME = %w[定時業務 納品業務 商品管理業務 清掃業務]

TAXON_NAME.each.with_index(1) { |taxon, i| Taxon.find_or_create_by(id: i, name: taxon) }
