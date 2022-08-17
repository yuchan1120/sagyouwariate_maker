require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(
      name: '一郎',
      email: 'itirou@example.com',
      password: 'itirou'
    )
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors).to be_of_kind(:name, :blank)
  end

  it 'is invalid if name is 7 characters or more' do
    user = User.new(name: 12_345_678)
    user.valid?
    expect(user.errors).to be_of_kind(:name, :too_long)
  end
end
