require 'rails_helper'

RSpec.describe 'Taxons', type: :system do
  before do
    @user = create(:user)
    @taxon = create(:regular_work)
    @work = create(:work, user: @user, taxon: @taxon)
    sign_in_as @user
    visit works_path
  end

  scenario 'user sees works in taxon' do
    find("#taxon_#{@taxon.id}").click

    expect(current_path).to eq taxon_path(@taxon.id)
    expect(page).to have_content @work.name
  end
end
