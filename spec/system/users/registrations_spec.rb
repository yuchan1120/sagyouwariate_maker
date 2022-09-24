require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :system do
  before do
    @user = create(:user)
    @taxon = create(:regular_work)
    janitor = create(:janitor)
    create(:sample_table, user: janitor)
  end

  scenario 'user registers a new account' do
    expect do
      visit root_path
      find('#new_user_registration').click
      fill_in 'user[name]', with: '一郎'
      fill_in 'user[email]', with: 'new@example.com'
      fill_in 'user[password]', with: 'newnew'
      fill_in 'user[password_confirmation]', with: 'newnew'
      find('#submit_registration').click

      expect(current_path).to eq tables_path
      expect(page).to have_content 'アカウント登録が完了しました。'
      expect(page).to have_content 'サンプルデータ'

      find('#header_menu_work_index').click

      expect(page).to have_content '仮点検'
    end.to change(User, :count).by(1)
  end

  scenario 'user updates an account' do
    sign_in_as @user
    visit root_path
    find('#edit_user_registration').click
    fill_in 'user[password]', with: 'new_password'
    fill_in 'user[password_confirmation]', with: 'new_password'
    fill_in 'user[current_password]', with: @user.password
    find('#submit_update').click

    expect(page).to have_content 'アカウント情報を変更しました。'
  end
end
