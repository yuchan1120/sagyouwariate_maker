require 'rails_helper'

RSpec.describe 'Top', type: :request do
  describe '#index' do
    it 'responds successfully' do
      get root_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
