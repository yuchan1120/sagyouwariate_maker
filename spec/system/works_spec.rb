require 'rails_helper'

RSpec.describe 'Works', type: :system do
  before do
    @user = create(:user)
    @taxon1 = create(:regular_work)
    @taxon2 = create(:deliver_work)
    @taxon3 = create(:product_management_work)
    @taxon4 = create(:cleaning_work)
    @work = create(:work, user: @user, taxon: @taxon1)
    sign_in_as @user
  end

  scenario 'user creates a new work' do
    expect do
      find('#header_menu_work_registration').click
      fill_in 'work[name]', with: 'Test'
      fill_in 'work[time_required]', with: '10'
      select '定時業務', from: 'work[taxon_id]'
      find('#submit_registration').click

      expect(page).to have_content '業務を新規登録しました'
      expect(page).to have_content 'Test'
    end.to change(@user.works, :count).by(1)
  end

  scenario 'user updates a work' do
    find('#header_menu_work_index').click
    find("#edit_work_#{@work.id}").click
    fill_in 'work[name]', with: 'New work Name'
    find('#submit_registration').click

    expect(page).to have_content "IDが「#{@work.id}」の業務を更新しました"
    expect(page).to have_content 'New work Name'
  end

  scenario 'user deletes a work' do
    expect do
      find('#header_menu_work_index').click
      find("#delete_work_#{@work.id}").click

      expect(page).to have_content '業務を削除しました'
      expect(page).to_not have_content @work.name
    end.to change(@user.works, :count).by(-1)
  end
end
