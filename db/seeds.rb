TAXON_NAME = %w[定時業務 納品業務 商品管理業務 清掃業務].freeze

TAXON_NAME.each.with_index(1) { |taxon, i| Taxon.find_or_create_by(id: i, name: taxon) }

user = User.new(name: '管理人', email: 'thahz3jq2@example.com', password: '123456')
user.save

Table.find_or_create_by(
  title: 'サンプルデータ', a1: '仮点検　(10分)', a5: '温度点検　(10分)', a12: '仮点検　(10分)', a21: '鮮度管理　(15分)',
  a25: 'ピーク対応', a29: '売上日報　(60分)', a33: '鮮度管理　(15分)', a34: 'ATM入金　(10分)', a45: '仮点検　(10分)',
  a49: 'ATM入金　(10分)', a50: '伝票集計　(20分)', a53: '鮮度管理　(15分)', a65: '仮点検　(10分)',
  a66: 'ATM入金　(10分)', a69: '鮮度管理　(15分)', a73: 'ストアスタンプ日付変更　(2分)', a77: '深夜鮮度管理　(45分)',
  a93: '鮮度管理　(15分)', b13: '米飯2便納品　(30分)', b14: 'チルド2便納品　(30分)', b37: '米飯3便納品　(30分)',
  b38: 'チルド3便納品　(30分)', b39: 'オリジナルパン3便納品　(15分)', b49: '週3菓子納品　(60分)',
  b65: '米飯1便納品　(30分)', b81: 'チルド1便納品　(60分)', b85: 'オリジナルパン1便納品　(30分)',
  b89: '山崎パン1便納品　(10分)', b90: '雑誌納品　(45分)', b93: 'フローズン納品　(20分)', b94: '新聞納品　(15分)',
  c1: '缶ウォーマー補充　(5分)', c2: 'HCケース補充　(20分)', c3: 'フェイスアップ　(15分)',
  c4: 'フライヤー仕込み　(30分)', c5: 'おでん仕込み　(20分)', c6: '中華まん仕込み　(10分)', c9: '発注：米飯　(20分)',
  c10: '発注：調理パン　(10分)', c11: '発注：ペストリー　(20分)', c17: 'フェイスアップ　(15分)',
  c18: '販売データ確認　(20分)', c21: 'フライヤー追加仕込み　(15分)', c22: 'カウンター消耗品補充　(15分)',
  c33: 'フェイスアップ　(15分)', c41: 'フライヤー仕込み　(30分)', c42: '商品補充：菓子　(30分)',
  c45: '商品補充：加食　(15分)', c46: "商品補充：雑貨　(15分)\t", c47: 'フェイスアップ　(15分)',
  c53: '雑誌返本　(30分)', c57: '販売データ確認　(20分)', c58: '死筋排除　(40分)', c61: '発注：サラダ・惣菜　(20分)',
  c62: '発注：調理麺　(15分)', c63: '発注：牛乳・乳飲料　(20分)', c65: '発注：加食　(5分)', c66: '発注：雑貨　(5分)',
  c69: '新聞返品処理　(15分)', c70: 'フェイスアップ　(15分)', c71: 'フライヤー電源OFF　(1分)',
  c73: 'おでんスープ交換　(20分)', c77: '商品補充：ソフトドリンク　(30分)', d9: 'トイレ清掃　(15分)',
  d10: '床清掃　(10分)', d11: 'レジカウンター清掃　(10分)', d17: '店外清掃　(20分)', d18: 'コピー機清掃　(10分)',
  d19: 'ATM清掃　(5分)', d29: 'ゴミ袋交換　(10分)', d30: 'トイレ清掃　(15分)', d31: '床清掃　(10分)',
  d33: 'チルドケース清掃　(20分)', d45: '店外清掃　(10分)', d53: 'リーチイン清掃　(10分)',
  d54: 'アイスケース清掃　(10分)', d57: 'ゴミ袋交換　(10分)', d58: 'トイレ清掃　(15分)', d59: '床清掃　(10分)',
  d81: 'おでん什器清掃　(20分)', d82: 'フライヤー什器清掃　(20分)', d83: '常温フライヤー什器清掃　(20分)',
  d85: '中華まん什器清掃　(20分)', d86: 'フライヤー本体清掃　(40分)', d89: 'グリストラップ清掃　(20分)',
  user_id: User.find_by(email: 'thahz3jq2@example.com').id, default_data: true
)

Work.find_or_create_by(name: '買い物カゴ拭き上げ', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: '弁当ケース清掃', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: '店外清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: '床清掃', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: '常温フライヤー什器清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: '中華まん什器清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'レジカウンター清掃', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'リーチイン清掃', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'フライヤー本体清掃', time_required: 40, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'フライヤー什器清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'トイレ清掃', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'チルドケース清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'ゴンドラ清掃', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'ゴミ袋交換', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'コピー機清掃', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'グリストラップ清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'アイスケース清掃', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'おでん什器清掃', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: 'ATM清掃', time_required: 5, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 4, default_data: true)
Work.find_or_create_by(name: '雑誌返本', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '追加・修正発注', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '販売データ確認', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '缶ウォーマー補充', time_required: 5, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：雑貨', time_required: 5, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：調理麺', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：調理パン', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：菓子', time_required: 5, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：米飯', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：牛乳・乳飲料', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：加食', time_required: 5, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：ペストリー', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '発注：サラダ・惣菜', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '死筋排除', time_required: 40, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '新聞返品処理', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '商品補充：雑貨', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '商品補充：菓子', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '商品補充：牛乳・乳飲料', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '商品補充：加食', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '商品補充：ソフトドリンク', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '中華まん仕込み', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'フライヤー電源OFF', time_required: 1, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'フライヤー追加仕込み', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'フライヤー仕込み', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'フェイスアップ', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'カウンター消耗品補充', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'おでん仕込み', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'おでんスープ交換', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: 'HCケース補充', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 3, default_data: true)
Work.find_or_create_by(name: '雑誌納品', time_required: 45, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '週3雑貨納品', time_required: 60, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '週3菓子納品', time_required: 60, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '週3加食納品', time_required: 60, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '米飯3便納品', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '米飯2便納品', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '米飯1便納品', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '新聞納品', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '山崎パン2便納品', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '山崎パン1便納品', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: 'フローズン納品', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: 'チルド3便納品', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: 'チルド2便納品', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: 'チルド1便納品', time_required: 60, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: 'オリジナルパン3便納品', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: 'オリジナルパン1便納品', time_required: 30, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 2, default_data: true)
Work.find_or_create_by(name: '鮮度管理', time_required: 15, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: '温度点検', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: '深夜鮮度管理', time_required: 45, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: '売上日報', time_required: 60, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: '伝票集計', time_required: 20, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: '仮点検', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: 'ストアスタンプ日付変更', time_required: 2, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
Work.find_or_create_by(name: 'ATM入金', time_required: 10, user_id: User.find_by(email: 'thahz3jq2@example.com').id, taxon_id: 1, default_data: true)
