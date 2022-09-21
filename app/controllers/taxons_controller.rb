class TaxonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @taxon = Taxon.find(params[:id])
    @all_taxons = Taxon.all
    @works = Work.owner(current_user).category(@taxon.id).order("#{sort_column} #{sort_direction}")
  end

  private

  def sort_column
    params[:sort] || 'updated_at'
  end

  def sort_direction
    params[:direction] || 'desc'
  end
end
