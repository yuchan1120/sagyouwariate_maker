require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @taxon = FactoryBot.create(:taxon)
  end

  it "is valid with a name, time_required, user, and taxon" do
    work = Work.new(
      name: "新しい業務",
      time_required: "10",
      user: @user,
      taxon: @taxon,
    )
    expect(work).to be_valid
  end

  it "is invalid without a name" do
    work = Work.new(name: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:name, :blank)
  end

  it "is invalid without a time_required" do
    work = Work.new(time_required: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:time_required, :blank)
  end

  it "is invalid if time_required is not a number" do
    work = Work.new(time_required: "a")
    work.valid?
    expect(work.errors).to be_of_kind(:time_required, :not_a_number)
  end

  it "is invalid without an user_id" do
    work = Work.new(user_id: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:user_id, :blank)
  end

  it "is invalid if user_id is not a number" do
    work = Work.new(user_id: "a")
    work.valid?
    expect(work.errors).to be_of_kind(:user_id, :not_a_number)
  end

  it "is invalid without an taxon_id" do
    work = Work.new(taxon_id: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:taxon_id, :blank)
  end

  it "is invalid if taxon_id is not a number" do
    work = Work.new(taxon_id: "a")
    work.valid?
    expect(work.errors).to be_of_kind(:taxon_id, :not_a_number)
  end
end
