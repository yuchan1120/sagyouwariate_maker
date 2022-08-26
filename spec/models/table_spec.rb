require 'rails_helper'

RSpec.describe Table, type: :model do
  before do
    @user = create(:user)
    @another_user = create(:another_user)
  end

  it 'is valid with an user' do
    table = Table.new(
      title: '新しい作業割当',
      user: @user
    )
    expect(table).to be_valid
  end

  it 'is invalid without an user_id' do
    table = Table.new(user_id: nil)
    table.valid?
    expect(table.errors).to be_of_kind(:user_id, :blank)
  end

  it 'is invalid if user_id is not a number' do
    table = Table.new(user_id: 'a')
    table.valid?
    expect(table.errors).to be_of_kind(:user_id, :not_a_number)
  end

  it 'returns tables with matching owner' do
    @table1 = create(:table, user: @user)
    @table2 = create(:table, user: @another_user)

    expect(Table.owner(@user)).to include(@table1)
    expect(Table.owner(@user)).to_not include(@table2)
    expect(Table.owner(@another_user)).to include(@table2)
    expect(Table.owner(@another_user)).to_not include(@table1)
  end

  it 'returns tables that match the search term' do
    @table1 = create(:table, title: '忙しい月曜日の作業割当', user: @user)
    @table2 = create(:table, title: '暇な月曜日の作業割当', user: @user)

    expect(Table.search_results('月曜日')).to include(@table1, @table2)
    expect(Table.search_results('忙しい')).to include(@table1)
    expect(Table.search_results('忙しい')).to_not include(@table2)
  end
end
