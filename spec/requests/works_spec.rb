require 'rails_helper'

RSpec.describe 'Works', type: :request do
  before do
    @user = create(:user)
    @another_user = create(:another_user)
    @taxon = create(:regular_work)
    @work = create(:work, user: @user, taxon: @taxon)
  end

  describe '#index' do
    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get works_path
        expect(response).to be_successful
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get works_path
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get works_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#new' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get new_work_path
        expect(response).to be_successful
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get new_work_path
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get new_work_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#create' do
    context 'as an authorized user' do
      context 'with valid attributes' do
        it 'adds a work' do
          work_params = attributes_for(:work, taxon_id: @taxon.id)
          sign_in @user
          expect do
            post works_path, params: { work: work_params }
          end.to change(@user.works, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a work' do
          work_params = attributes_for(:work, :invalid, taxon_id: @taxon.id)
          sign_in @user
          expect do
            post works_path, params: { work: work_params }
          end.to_not change(@user.works, :count)
        end
      end
    end

    context 'as a guest' do
      it 'does not adds a work' do
        work_params = attributes_for(:work, taxon_id: @taxon.id)
        expect do
          post works_path, params: { work: work_params }
        end.to_not change(Work, :count)
      end

      it 'returns a 302 response' do
        work_params = attributes_for(:work, taxon_id: @taxon.id)
        post works_path, params: { work: work_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        work_params = attributes_for(:work, taxon_id: @taxon.id)
        post works_path, params: { work: work_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#edit' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get edit_work_path(@work.id)
        expect(response).to be_successful
      end
    end

    context 'as an unauthorized user' do
      it 'redirects the page to root_path' do
        sign_in @another_user
        get edit_work_path(@work.id)
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get edit_work_path(@work.id)
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get edit_work_path(@work.id)
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it 'updates a work' do
        work_params = attributes_for(:work, name: 'New Work Name')
        sign_in @user
        patch work_path(@work.id), params: { work: work_params }
        expect(@work.reload.name).to eq 'New Work Name'
      end
    end

    context 'as an unauthorized user' do
      it 'does not update the work' do
        work_params = attributes_for(:work, name: 'New Work Name')
        sign_in @another_user
        patch work_path(@work.id), params: { work: work_params }
        expect(@work.reload.name).to eq '仮点検'
      end

      it 'redirects the page to root_path' do
        work_params = attributes_for(:work, title: 'New Work Name')
        sign_in @another_user
        patch work_path(@work.id), params: { work: work_params }
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        work_params = attributes_for(:work)
        patch work_path(@work.id), params: { work: work_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        work_params = attributes_for(:work)
        patch work_path(@work.id), params: { work: work_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#destroy' do
    context 'as an authorized user' do
      it 'deletes a work' do
        sign_in @user
        expect { delete work_path(@work.id) }.to change(@user.works, :count).by(-1)
      end
    end

    context 'as an unauthorized user' do
      it 'does not delete the project' do
        sign_in @another_user
        expect { delete work_path(@work.id) }.to_not change(Work, :count)
      end

      it 'redirects the page to root_path' do
        sign_in @another_user
        delete work_path(@work.id)
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'does not delete the work' do
        expect { delete work_path(@work.id) }.to_not change(Work, :count)
      end

      it 'returns a 302 response' do
        delete work_path(@work.id)
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        delete work_path(@work.id)
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
