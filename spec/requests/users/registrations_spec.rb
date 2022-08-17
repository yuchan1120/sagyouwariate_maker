require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :request do
  describe 'before account registration' do
    describe '#new' do
      it 'responds successfully' do
        get new_user_registration_path
        expect(response).to be_successful
      end
    end

    describe '#create' do
      it 'adds a user' do
        user_params = FactoryBot.attributes_for(:user)
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by(1)
      end
    end
  end

  describe 'after account registration' do
    before do
      @user = FactoryBot.create(:user)
    end

    describe '#edit' do
      it 'responds successfully' do
        sign_in @user
        get edit_user_registration_path(@user.id)
        expect(response).to be_successful
      end
    end

    describe '#update' do
      it 'updates a user' do
        sign_in @user
        user_params = FactoryBot.attributes_for(:user, email: 'new@example.com')
        patch user_registration_path(@user.id), params: { user: user_params }
        expect(@user.reload.email).to eq 'new@example.com'
      end
    end
  end
end
