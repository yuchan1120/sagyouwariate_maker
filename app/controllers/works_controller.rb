class WorksController < ApplicationController
  before_action :authenticate_user!
  before_action :work_owner?, only: %i[edit update destroy]

  def index
    @all_taxons = Taxon.all
    @works = Work.where('user_id::text LIKE?', "#{current_user.id}")
  end

  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.new(work_params)
    if @work.save
      flash[:notice] = '業務を新規登録しました'
      redirect_to :works
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @work.update(work_params)
      flash[:notice] = "IDが「#{@work.id}」の業務を更新しました"
      redirect_to :works
    else
      render 'edit'
    end
  end

  def destroy
    @work.destroy
    flash[:notice] = '業務を削除しました'
    redirect_to :works
  end

  def search
    @all_taxons = Taxon.all
    if params[:keyword].present?
      @works = Work.where(['user_id::text like? AND name like?', "#{current_user.id}", "%#{params[:keyword]}%"])
      flash[:search_results] = "検索結果：#{@works.count}件"
    else
      @works = Work.where('user_id::text LIKE?', "#{current_user.id}")
      flash[:search_results] = nil
    end
    render 'index'
  end

  private

  def work_owner?
    @work = Work.find(params[:id])
    redirect_to root_path unless @work.user_id == current_user.id
  end

  def work_params
    params.require(:work).permit(:name, :time_required, :taxon_id)
  end
end
