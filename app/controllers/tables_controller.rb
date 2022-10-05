class TablesController < ApplicationController
  SAMPLE_TABLE = Table.new(
    title: 'サンプルデータ', a1: '仮点検　(10分)', a5: '温度点検　(10分)', a12: '仮点検　(10分)', a21: '鮮度管理　(15分)',
    a25: 'ピーク対応', a29: '売上日報　(60分)', a33: '鮮度管理　(15分)', a34: 'ATM入金　(10分)', a45: '仮点検　(10分)',
    a49: 'ATM入金　(10分)', a50: '伝票集計　(20分)', a53: '鮮度管理　(15分)', a65: '仮点検　(10分)',
    a66: 'ATM入金　(10分)', a69: '鮮度管理　(15分)', a73: 'ストアスタンプ日付変更　(2分)', a77: '深夜鮮度管理　(45分)',
    a93: '温度管理　(10分)', b13: '米飯2便納品　(30分)', b14: 'チルド2便納品　(30分)', b37: '米飯3便納品　(30分)',
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
    d85: '中華まん什器清掃　(20分)', d86: 'フライヤー本体清掃　(40分)', d89: 'グリストラップ清掃　(20分)'
  )

  TABLE_INITIAL_VALUE = Table.new(
    a5: '温度点検　(10分)', a21: '鮮度管理　(15分)', a33: '鮮度管理　(15分)', a53: '鮮度管理　(15分)', a69: '鮮度管理　(15分)',
    a73: 'ストアスタンプ日付変更　(2分)', a77: '深夜鮮度管理　(45分)', a93: '温度管理　(10分)'
  )

  layout 'tables_show', only: :show
  before_action :authenticate_user!
  before_action :set_each_works, only: %i[new edit]
  before_action :table_owner?, only: %i[show edit update destroy]

  def index
    @tables = Table.owner(current_user).order("#{sort_column} #{sort_direction}")
    flash[:search_results] = nil
  end

  def new
    @table = params[:call_sample] ? SAMPLE_TABLE : TABLE_INITIAL_VALUE
  end

  def create
    cells_length = params[:cells_length].to_i
    params_cells = []
    cells_length.times do |num|
      params_cells.push(params["cell#{num}"])
    end
    @table = current_user.tables.new(title: params[:title], cells: params_cells)
    if @table.save
      flash[:notice] = '作業割当を新規登録しました'
      redirect_to :tables
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @table.update(table_params)
      flash[:notice] = "IDが「#{@table.id}」の作業割当を更新しました"
      redirect_to :tables
    else
      render 'edit'
    end
  end

  def clone
    @old_table = Table.find(params[:id])
    @table = @old_table.dup
    @table.save
    @table.update(title: "#{@table.title}(コピー)")
    flash[:notice] = "IDが「#{@old_table.id}」の作業割当を複製しました"
    redirect_to :tables
  end

  def destroy
    @table.destroy
    flash[:notice] = '作業割当を削除しました'
    redirect_to :tables
  end

  def search
    if params[:keyword].present?
      @tables = Table.owner(current_user).order("#{sort_column} #{sort_direction}").search_results(params[:keyword])
      flash[:search_results] = "検索結果：#{@tables.count}件"
      render 'index'
    else
      redirect_to :tables
    end
  end

  private

  def set_each_works
    @regular_works = Work.owner(current_user).category(1).order(:name)
    @deliver_works = Work.owner(current_user).category(2).order(:name)
    @product_management_works = Work.owner(current_user).category(3).order(:name)
    @cleaning_works = Work.owner(current_user).category(4).order(:name)
  end

  def table_owner?
    @table = Table.find(params[:id])
    redirect_to root_path unless @table.user_id == current_user.id
  end

  def table_params
    column = [:title]
    96.times do |num|
      column.push("a#{num + 1}".to_sym)
      column.push("b#{num + 1}".to_sym)
      column.push("c#{num + 1}".to_sym)
      column.push("d#{num + 1}".to_sym)
    end
    params.require(:table).permit(column)
  end

  def sort_column
    params[:sort] || 'updated_at'
  end

  def sort_direction
    params[:direction] || 'desc'
  end
end
