require 'rails_helper'

RSpec.describe 'Top', type: :request do
  before do
    @user = create(:user)
    janitor = create(:janitor)
    create(:sample_table, user: janitor)
  end

  describe '#top' do
    it 'responds successfully' do
      get root_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe '#usage' do
    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get usage_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get usage_path
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get usage_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#guest_sign_in' do
    it 'signs an user in as guest' do
      post guest_sign_in_path
      expect(response).to redirect_to new_table_path
    end
  end
end
