require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    @taxon = Taxon.create(
      id: "1",
      name:  "定時業務",
    )
  end
  
  it "is valid with a name, time_required, user_id, and taxon_id" do
    work = Work.new(
      name: "新しい業務",
      time_required: "10",
      user_id: "1",
      taxon: @taxon,
    )
    expect(work).to be_valid
  end

  it "is invalid without a name" do
    work = Work.new(name: nil)
    work.valid?
    expect(work.errors[:name]).to include("を入力してください")
  end

  it "is invalid without a time_required" do
    work = Work.new(time_required: nil)
    work.valid?
    expect(work.errors[:time_required]).to include("を入力してください")
  end

  it "is invalid if time_required is not a number" do
    work = Work.new(time_required: "a")
    work.valid?
    expect(work.errors[:time_required]).to include("は数値で入力してください")
  end

  it "is invalid without an user_id" do
    work = Work.new(user_id: nil)
    work.valid?
    expect(work.errors[:user_id]).to include("を入力してください")
  end

  it "is invalid if user_id is not a number" do
    work = Work.new(user_id: "a")
    work.valid?
    expect(work.errors[:user_id]).to include("は数値で入力してください")
  end

  it "is invalid without an taxon_id" do
    work = Work.new(taxon_id: nil)
    work.valid?
    expect(work.errors[:taxon_id]).to include("を入力してください")
  end

  it "is invalid if taxon_id is not a number" do
    work = Work.new(taxon_id: "a")
    work.valid?
    expect(work.errors[:taxon_id]).to include("は数値で入力してください")
  end
end
