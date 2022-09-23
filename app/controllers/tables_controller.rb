class TablesController < ApplicationController
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
    @table = current_user.tables.new(table_params)
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
