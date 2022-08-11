require 'rails_helper'

RSpec.describe "Tables", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @table = FactoryBot.create(:table, user: @user)
  end

  scenario "user creates a new table" do
    sign_in_as @user

    expect {
      find('#header_menu_create_new').click
      fill_in "table[title]", with: "Test"
      find('#commit_save').click

      expect(page).to have_content "作業割当を新規登録しました"
      expect(page).to have_content "Test"
    }.to change(@user.tables, :count).by(1)
  end

  scenario "user reads a table" do
    sign_in_as @user

    find('#header_menu_table_index').click
    find("#show_link_#{@table.id}").click

    expect(current_path).to eq table_path(@table.id)
  end

  scenario "user updates a table" do
    sign_in_as @user

    find('#header_menu_table_index').click
    find("#edit_link_#{@table.id}").click
    fill_in "table[title]", with: "New Table Name"
    find('#commit_save').click

    expect(page).to have_content "IDが「#{@table.id}」の作業割当を更新しました"
    expect(page).to have_content "New Table Name"
  end

  scenario "user clones a table" do
    sign_in_as @user

    expect {
      find('#header_menu_table_index').click
      find("#clone_link_#{@table.id}").click

      expect(page).to have_content "IDが「#{@table.id}」の作業割当を複製しました"
      expect(page).to have_content "#{@table.title}(コピー)"
    }.to change(@user.tables, :count).by(1)
  end

  scenario "user deletes a table" do
    sign_in_as @user

    expect {
      find('#header_menu_table_index').click
      find("#delete_link_#{@table.id}").click

      expect(page).to have_content "作業割当を削除しました"
      expect(page).to_not have_content @table.title
    }.to change(@user.tables, :count).by(-1)
  end
end
