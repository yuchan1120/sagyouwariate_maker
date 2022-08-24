class TaxonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @taxon = Taxon.find(params[:id])
    @all_taxons = Taxon.all
    @works = Work.owner(current_user).category(@taxon.id).order(updated_at: "DESC")
  end
end
