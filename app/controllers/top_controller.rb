class TopController < ApplicationController
  include Common
  layout 'top'

  def top
    redirect_to tables_path if user_signed_in?
  end

  def usage
    authenticate_user!
  end

  def guest_sign_in
    user = User.create(name: 'ゲスト', email: 'k#av92rfgagv@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    user.update(email: "k#av9#{user.id}2rfgagv@example.com")
    sign_in user
    create_default_works
    create_default_table
    redirect_to new_table_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def create_default_works
    Work.create(name: '買い物カゴ拭き上げ', time_required: 15, user_id: current_user.id, taxon_id: 4)
    Work.create(name: '弁当ケース清掃', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: '店外清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: '床清掃', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: '常温フライヤー什器清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: '中華まん什器清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'レジカウンター清掃', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'リーチイン清掃', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'フライヤー本体清掃', time_required: 40, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'フライヤー什器清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'トイレ清掃', time_required: 15, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'チルドケース清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'ゴンドラ清掃', time_required: 30, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'ゴミ袋交換', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'コピー機清掃', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'グリストラップ清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'アイスケース清掃', time_required: 10, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'おでん什器清掃', time_required: 20, user_id: current_user.id, taxon_id: 4)
    Work.create(name: 'ATM清掃', time_required: 5, user_id: current_user.id, taxon_id: 4)
    Work.create(name: '雑誌返本', time_required: 30, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '追加・修正発注', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '販売データ確認', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '缶ウォーマー補充', time_required: 5, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：雑貨', time_required: 5, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：調理麺', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：調理パン', time_required: 10, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：菓子', time_required: 5, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：米飯', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：牛乳・乳飲料', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：加食', time_required: 5, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：ペストリー', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '発注：サラダ・惣菜', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '死筋排除', time_required: 40, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '新聞返品処理', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '商品補充：雑貨', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '商品補充：菓子', time_required: 30, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '商品補充：牛乳・乳飲料', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '商品補充：加食', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '商品補充：ソフトドリンク', time_required: 30, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '中華まん仕込み', time_required: 10, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'フライヤー電源OFF', time_required: 1, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'フライヤー追加仕込み', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'フライヤー仕込み', time_required: 30, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'フェイスアップ', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'カウンター消耗品補充', time_required: 15, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'おでん仕込み', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'おでんスープ交換', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: 'HCケース補充', time_required: 20, user_id: current_user.id, taxon_id: 3)
    Work.create(name: '雑誌納品', time_required: 45, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '週3雑貨納品', time_required: 60, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '週3菓子納品', time_required: 60, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '週3加食納品', time_required: 60, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '米飯3便納品', time_required: 30, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '米飯2便納品', time_required: 30, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '米飯1便納品', time_required: 30, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '新聞納品', time_required: 15, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '山崎パン2便納品', time_required: 10, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '山崎パン1便納品', time_required: 10, user_id: current_user.id, taxon_id: 2)
    Work.create(name: 'フローズン納品', time_required: 20, user_id: current_user.id, taxon_id: 2)
    Work.create(name: 'チルド3便納品', time_required: 30, user_id: current_user.id, taxon_id: 2)
    Work.create(name: 'チルド2便納品', time_required: 30, user_id: current_user.id, taxon_id: 2)
    Work.create(name: 'チルド1便納品', time_required: 60, user_id: current_user.id, taxon_id: 2)
    Work.create(name: 'オリジナルパン3便納品', time_required: 15, user_id: current_user.id, taxon_id: 2)
    Work.create(name: 'オリジナルパン1便納品', time_required: 30, user_id: current_user.id, taxon_id: 2)
    Work.create(name: '鮮度管理', time_required: 15, user_id: current_user.id, taxon_id: 1)
    Work.create(name: '温度点検', time_required: 10, user_id: current_user.id, taxon_id: 1)
    Work.create(name: '深夜鮮度管理', time_required: 45, user_id: current_user.id, taxon_id: 1)
    Work.create(name: '売上日報', time_required: 60, user_id: current_user.id, taxon_id: 1)
    Work.create(name: '伝票集計', time_required: 20, user_id: current_user.id, taxon_id: 1)
    Work.create(name: '仮点検', time_required: 10, user_id: current_user.id, taxon_id: 1)
    Work.create(name: 'ストアスタンプ日付変更', time_required: 2, user_id: current_user.id, taxon_id: 1)
    Work.create(name: 'ATM入金', time_required: 10, user_id: current_user.id, taxon_id: 1)
  end
end
