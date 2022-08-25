require 'rails_helper'

RSpec.describe Work, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:another_user)
    @regular_work = FactoryBot.create(:regular_work)
    @deliver_work = FactoryBot.create(:deliver_work)
  end

  it 'is valid with a name, time_required, user, and taxon' do
    work = Work.new(
      name: '新しい業務',
      time_required: '10',
      user: @user,
      taxon: @regular_work
    )
    expect(work).to be_valid
  end

  it 'is invalid without a name' do
    work = Work.new(name: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:name, :blank)
  end

  it 'is invalid without a time_required' do
    work = Work.new(time_required: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:time_required, :blank)
  end

  it 'is invalid if time_required is not a number' do
    work = Work.new(time_required: 'a')
    work.valid?
    expect(work.errors).to be_of_kind(:time_required, :not_a_number)
  end

  it 'is invalid without an user_id' do
    work = Work.new(user_id: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:user_id, :blank)
  end

  it 'is invalid if user_id is not a number' do
    work = Work.new(user_id: 'a')
    work.valid?
    expect(work.errors).to be_of_kind(:user_id, :not_a_number)
  end

  it 'is invalid without an taxon_id' do
    work = Work.new(taxon_id: nil)
    work.valid?
    expect(work.errors).to be_of_kind(:taxon_id, :blank)
  end

  it 'is invalid if taxon_id is not a number' do
    work = Work.new(taxon_id: 'a')
    work.valid?
    expect(work.errors).to be_of_kind(:taxon_id, :not_a_number)
  end

  it 'returns works with matching owner' do
    @work1 = FactoryBot.create(:work, user: @user, taxon: @regular_work)
    @work2 = FactoryBot.create(:work, user: @another_user, taxon: @regular_work)

    expect(Work.owner(@user)).to include(@work1)
    expect(Work.owner(@user)).to_not include(@work2)
    expect(Work.owner(@another_user)).to include(@work2)
    expect(Work.owner(@another_user)).to_not include(@work1)
  end

  it 'returns works with matching category' do
    @work1 = FactoryBot.create(:work, user: @user, taxon: @regular_work)
    @work2 = FactoryBot.create(:work, user: @user, taxon: @deliver_work)

    expect(Work.category(1)).to include(@work1)
    expect(Work.category(1)).to_not include(@work2)
    expect(Work.category(2)).to include(@work2)
    expect(Work.category(2)).to_not include(@work1)
  end

  it 'returns works that match the search term' do
    @work1 = FactoryBot.create(:work, name: 'ハードな業務', user: @user, taxon: @regular_work)
    @work2 = FactoryBot.create(:work, name: 'イージーな業務', user: @user, taxon: @regular_work)

    expect(Work.search_results('業務')).to include(@work1, @work2)
    expect(Work.search_results('ハード')).to include(@work1)
    expect(Work.search_results('ハード')).to_not include(@work2)
  end
end
