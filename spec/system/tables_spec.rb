require 'rails_helper'

RSpec.describe "Tables", type: :system do
  scenario "user creates a new table" do
    user = FactoryBot.create(:user)
    sign_in_as user

    expect {
      find('#header_menu_create_new').click
      fill_in "table[title]", with: "Test"
      find('#commit_save').click

      expect(page).to have_content "作業割当を新規登録しました"
      expect(page).to have_content "Test"
    }.to change(user.tables, :count).by(1)
  end
end
