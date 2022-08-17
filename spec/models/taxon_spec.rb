require 'rails_helper'

RSpec.describe Taxon, type: :model do
  it 'is valid with a name' do
    taxon = Taxon.new(name: '定時業務')
    expect(taxon).to be_valid
  end

  it 'is invalid without a name' do
    taxon = Taxon.new(name: nil)
    taxon.valid?
    expect(taxon.errors).to be_of_kind(:name, :blank)
  end
end
