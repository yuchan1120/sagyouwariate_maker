class TaxonsController < ApplicationController
  def show
    @taxon = Taxon.find(params[:id])
    @all_taxons = Taxon.all
    @works = Work.where(["user_id::text LIKE? AND taxon_id::text LIKE?", "#{current_user.id}", "#{@taxon.id}"])
  end
end
