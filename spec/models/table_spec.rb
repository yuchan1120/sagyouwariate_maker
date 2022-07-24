require 'rails_helper'

RSpec.describe Table, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with an user" do
    table = Table.new(
      title: "新しい作業割当",
      user:  @user,
    )
    expect(table).to be_valid
  end

  it "is invalid without an user_id" do
    table = Table.new(user_id: nil)
    table.valid?
    expect(table.errors).to be_of_kind(:user_id, :blank)
  end

  it "is invalid if user_id is not a number" do
    table = Table.new(user_id: "a")
    table.valid?
    expect(table.errors).to be_of_kind(:user_id, :not_a_number)
  end
end
