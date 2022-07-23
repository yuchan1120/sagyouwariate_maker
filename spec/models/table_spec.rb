require 'rails_helper'

RSpec.describe Table, type: :model do
  it "is valid with an user_id" do
    table = Table.new(
      title: "新しい作業割当",
      user_id:  "1",
    )
    expect(table).to be_valid
  end

  it "is invalid without an user_id" do
    table = Table.new(user_id: nil)
    table.valid?
    expect(table.errors[:user_id]).to include("を入力してください")
  end
  
  it "is invalid if user_id is not a number" do
    table = Table.new(user_id: "a")
    table.valid?
    expect(table.errors[:user_id]).to include("は数値で入力してください")
  end
end
