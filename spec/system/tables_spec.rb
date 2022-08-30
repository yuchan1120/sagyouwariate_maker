require 'rails_helper'

RSpec.describe 'Tables', type: :system do
  before do
    @user = create(:user)
    @table = create(:table, user: @user)
    sign_in_as @user
  end

  scenario 'user creates a new table' do
    expect do
      find('#header_menu_create_new').click
      fill_in 'table[title]', with: 'Test'
      find('#submit_save').click

      expect(page).to have_content '作業割当を新規登録しました'
      expect(page).to have_content 'Test'
    end.to change(@user.tables, :count).by(1)
  end

  scenario 'user calls sample data' do
    visit new_table_path

    find('#set_sample_data_tables').click

    expect(current_path).to eq new_table_path
    expect(page).to have_xpath "//input[@value='サンプルデータ' and @name='table[title]']"
  end

  scenario 'user reads a table' do
    find('#header_menu_table_index').click
    find("#show_table_#{@table.id}").click

    expect(current_path).to eq table_path(@table.id)
  end

  scenario 'user updates a table' do
    find('#header_menu_table_index').click
    find("#edit_table_#{@table.id}").click
    fill_in 'table[title]', with: 'New Table Name'
    find('#submit_save').click

    expect(page).to have_content "IDが「#{@table.id}」の作業割当を更新しました"
    expect(page).to have_content 'New Table Name'
  end

  scenario 'user clones a table' do
    expect do
      find('#header_menu_table_index').click
      find("#clone_table_#{@table.id}").click

      expect(page).to have_content "IDが「#{@table.id}」の作業割当を複製しました"
      expect(page).to have_content "#{@table.title}(コピー)"
    end.to change(@user.tables, :count).by(1)
  end

  scenario 'user deletes a table' do
    expect do
      find('#header_menu_table_index').click
      find("#delete_table_#{@table.id}").click

      expect(page).to have_content '作業割当を削除しました'
      expect(page).to_not have_content @table.title
    end.to change(@user.tables, :count).by(-1)
  end

  describe 'user searches the tables' do
    before do
      @table1 = Table.create(
        title: '忙しい月曜日の作業割当',
        user: @user
      )
      @table2 = Table.create(
        title: '暇な月曜日の作業割当',
        user: @user
      )
      visit tables_path
    end

    context 'when a keyword is entered' do
      scenario 'user finds matching tables' do
        expect(page).to have_content '忙しい月曜日の作業割当'
        expect(page).to have_content '暇な月曜日の作業割当'

        fill_in 'keyword', with: '月曜日'
        find('#commit_search').click

        expect(page).to have_content '検索結果：2件'
        expect(page).to have_content '忙しい月曜日の作業割当'
        expect(page).to have_content '暇な月曜日の作業割当'

        fill_in 'keyword', with: '忙しい'
        find('#commit_search').click

        expect(page).to have_content '検索結果：1件'
        expect(page).to have_content '忙しい月曜日の作業割当'
        expect(page).to_not have_content '暇な月曜日の作業割当'

        fill_in 'keyword', with: '火曜日'
        find('#commit_search').click

        expect(page).to have_content '検索結果：0件'
        expect(page).to_not have_content '忙しい月曜日の作業割当'
        expect(page).to_not have_content '暇な月曜日の作業割当'
      end
    end

    context 'when no keyword is entered' do
      scenario 'user sees all tables' do
        fill_in 'keyword', with: ''
        find('#commit_search').click

        expect(page).to_not have_content '検索結果：2件'
        expect(page).to have_content '忙しい月曜日の作業割当'
        expect(page).to have_content '暇な月曜日の作業割当'
      end
    end
  end
end
