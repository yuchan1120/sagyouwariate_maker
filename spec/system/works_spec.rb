require 'rails_helper'

RSpec.describe "Works", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @taxon1 = FactoryBot.create(:regular_work)
    @taxon2 = FactoryBot.create(:deliver_work)
    @taxon3 = FactoryBot.create(:product_management_work)
    @taxon4 = FactoryBot.create(:cleaning_work)
    @work = FactoryBot.create(:work, user: @user, taxon: @taxon1)
    sign_in_as @user
  end

  scenario "user creates a new work" do
    expect {
      find('#header_menu_work_registration').click
      fill_in "work[name]", with: "Test"
      fill_in "work[time_required]", with: "10"
      select '定時業務', from: 'work[taxon_id]'
      find('#commit_registration').click

      expect(page).to have_content "業務を新規登録しました"
      expect(page).to have_content "Test"
    }.to change(@user.works, :count).by(1)
  end

  scenario "user updates a work" do
    find('#header_menu_work_index').click
    find("#edit_link_#{@work.id}").click
    fill_in "work[name]", with: "New work Name"
    find('#commit_registration').click

    expect(page).to have_content "IDが「#{@work.id}」の業務を更新しました"
    expect(page).to have_content "New work Name"
  end

  scenario "user deletes a work" do
    expect {
      find('#header_menu_work_index').click
      find("#delete_link_#{@work.id}").click

      expect(page).to have_content "業務を削除しました"
      expect(page).to_not have_content @work.name
    }.to change(@user.works, :count).by(-1)
  end
end
