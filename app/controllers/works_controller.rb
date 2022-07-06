class WorksController < ApplicationController
  before_action :authenticate_user!

  def index
    @works = Work.where("user_id::text LIKE?", "#{current_user.id}")
  end
end
