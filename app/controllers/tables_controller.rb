class TablesController < ApplicationController
  SAMPLE_TABLE = Table.new(
    title: 'サンプルデータ',
    cells: [
      '6:00', '仮点検　(10分)', '', '缶ウォーマー補充　(5分)', '', '', '', '', 'HCケース補充　(20分)', '',
      '', '', '', 'フェイスアップ　(15分)', '', '', '', '', 'フライヤー仕込み　(30分)', '',
      '7:00', '温度点検　(10分)', '', 'おでん仕込み　(20分)', '', '', '', '', '中華まん仕込み　(10分)', '',
      '8:00', '', '', '発注：米飯　(20分)', 'トイレ清掃　(15分)', '', '', '', '発注：調理パン　(10分)', '床清掃　(10分)',
      '', '', '', '発注：ペストリー　(20分)', 'レジカウンター清掃　(10分)', '', '仮点検　(10分)', '', '', '',
      '9:00', '', '米飯2便納品　(30分)', '', '', '', '', 'チルド2便納品　(30分)', '', '',
      '10:00', '', '', 'フェイスアップ　(15分)', '店外清掃　(20分)', '', '', '', '販売データ確認　(20分)', 'コピー機清掃　(10分)',
      '', '', '', '', 'ATM清掃　(5分)',
      '11:00', '鮮度管理　(15分)', '', 'フライヤー追加仕込み　(15分)', '', '', '', '', 'カウンター消耗品補充　(15分)', '',
      '12:00', 'ピーク対応', '', '', '',
      '13:00', '売上日報　(60分)', '', '', 'ゴミ袋交換　(10分)', '', '', '', '', 'トイレ清掃　(15分)', '', '', '', '', '床清掃　(10分)',
      '14:00', '鮮度管理　(15分)', '', 'フェイスアップ　(15分)', 'チルドケース清掃　(20分)', '', 'ATM入金　(10分)', '', '', '',
      '15:00', '', '米飯3便納品　(30分)', '', '', '', '', 'チルド3便納品　(30分)', '', '', '', '', 'オリジナルパン3便納品　(15分)', '', '',
      '16:00', '', '', 'フライヤー仕込み　(30分)', '', '', '', '', '商品補充：菓子　(30分)', '',
      '17:00', '仮点検　(10分)', '', '商品補充：加食　(15分)', '店外清掃　(10分)', '', '', '', '商品補充：雑貨　(15分)', '',
      '', '', '', 'フェイスアップ　(15分)', '',
      '18:00', 'ATM入金　(10分)', '', '週3菓子納品　(60分)', '', '', '伝票集計　(20分)', '', '', '',
      '19:00', '鮮度管理　(15分)', '', '雑誌返本　(30分)', 'リーチイン清掃　(10分)', '', '', '', '', 'アイスケース清掃　(10分)',
      '20:00', '', '', '販売データ確認　(20分)', 'ゴミ袋交換　(10分)', '', '', '', '死筋排除　(40分)', 'トイレ清掃　(15分)',
      '', '', '', '', '床清掃　(10分)',
      '21:00', '', '', '発注：サラダ・惣菜　(20分)', '', '', '', '', '発注：調理麺　(15分)', '', '', '', '', '発注：牛乳・乳飲料　(20分)', '',
      '22:00', '仮点検　(10分)', '米飯1便納品　(30分)', '', '発注：加食　(5分)', '', 'ATM入金　(10分)', '', '発注：雑貨　(5分)', '',
      '23:00', '鮮度管理　(15分)', '', '新聞返品処理　(15分)', '', '', '', '', 'フェイスアップ　(15分)', '', '', '', '', 'フライヤー電源OFF　(1分)', '',
      '0:00', 'ストアスタンプ日付変更　(2分)', '', 'おでんスープ交換　(20分)', '',
      '1:00', '深夜鮮度管理　(45分)', '', '商品補充：ソフトドリンク　(30分)', '',
      '2:00', '', 'チルド1便納品　(60分)', '', 'おでん什器清掃　(20分)', '', '', '', '', 'フライヤー什器清掃　(20分)',
      '', '', '', '', '常温フライヤー什器清掃　(20分)',
      '3:00', '', 'オリジナルパン1便納品　(30分)', '', '中華まん什器清掃　(20分)', '', '', '', '', 'フライヤー本体清掃　(40分)',
      '4:00', '', '山崎パン1便納品　(10分)', '', 'グリストラップ清掃　(20分)', '', '', '雑誌納品　(45分)', '', '',
      '5:00', '温度点検　(10分)', 'フローズン納品　(20分)', '', '', '', '', '新聞納品　(15分)', '', ''
    ],
    size: 57
  )

  TABLE_INITIAL_VALUE = Table.new(
    cells: [
      '6:00', '', '', '', '', '7:00', '温度点検　(10分)', '', '', '', '8:00', '', '', '', '', '9:00', '', '', '', '',
      '10:00', '', '', '', '', '11:00', '鮮度管理　(15分)', '', '', '', '12:00', '', '', '', '', '13:00', '', '', '', '',
      '14:00', '鮮度管理　(15分)', '', '', '', '15:00', '', '', '', '', '16:00', '', '', '', '', '17:00', '', '', '', '',
      '18:00', '', '', '', '', '19:00', '鮮度管理　(15分)', '', '', '', '20:00', '', '', '', '', '21:00', '', '', '', '',
      '22:00', '', '', '', '', '23:00', '鮮度管理　(15分)', '', '', '', '0:00', 'ストアスタンプ日付変更　(2分)', '', '', '',
      '1:00', '深夜鮮度管理　(45分)', '', '', '', '2:00', '', '', '', '', '3:00', '', '', '', '', '4:00', '', '', '', '',
      '5:00', '温度点検　(10分)', '', '', ''
    ],
    size: 24
  )

  layout 'tables_show', only: :show
  before_action :authenticate_user!
  before_action :set_each_works, only: %i[new edit]
  before_action :table_owner?, only: %i[show edit update destroy]
  before_action :set_params_cells, only: %i[create update]

  def index
    @tables = Table.owner(current_user).order("#{sort_column} #{sort_direction}")
    flash[:search_results] = nil
  end

  def new
    @table = params[:call_sample] ? SAMPLE_TABLE : TABLE_INITIAL_VALUE
  end

  def create
    @table = current_user.tables.new(title: params[:title], cells: @params_cells, size: params[:table_size])
    if @table.save
      flash[:notice] = '作業割当を新規登録しました'
      redirect_to :tables
    else
      render 'new'
    end
  end

  def show
    @rows = @table.cells.each_slice(5).to_a
  end

  def edit; end

  def update
    if @table.update(title: params[:title], cells: @params_cells, size: params[:table_size])
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

  def set_params_cells
    cells_length = params[:cells_length].to_i
    @params_cells = []
    cells_length.times do |num|
      @params_cells.push(params["cell#{num}"])
    end
  end

  def sort_column
    params[:sort] || 'updated_at'
  end

  def sort_direction
    params[:direction] || 'desc'
  end
end
