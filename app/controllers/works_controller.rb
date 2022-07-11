class WorksController < ApplicationController
  before_action :authenticate_user!

  def index
    @works = Work.where("user_id::text LIKE?", "#{current_user.id}")
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = "業務を新規登録しました"
      redirect_to :works
    else
      render "new"
    end
  end

  def work_params
    params.require(:work).permit(:name, :time_required, :user_id, :taxon_id)
  end
end
