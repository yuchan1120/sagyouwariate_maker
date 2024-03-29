require 'rails_helper'

RSpec.describe 'Tables', type: :request do
  before do
    @user = create(:user)
    @another_user = create(:another_user)
    @table = create(:table, user: @user)
  end

  describe '#index' do
    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get tables_path
        expect(response).to be_successful
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get tables_path
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get tables_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#new' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get new_table_path
        expect(response).to be_successful
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get new_table_path
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get new_table_path
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#create' do
    context 'as an authorized user' do
      it 'adds a table' do
        sign_in @user
        expect do
          post tables_path, params: { table_size: 1 }
        end.to change(@user.tables, :count).by(1)
      end
    end

    context 'as a guest' do
      it 'does not adds a table' do
        expect do
          post tables_path, params: { table_size: 1 }
        end.to_not change(Table, :count)
      end

      it 'returns a 302 response' do
        post tables_path, params: { table_size: 1 }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        post tables_path, params: { table_size: 1 }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#show' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get table_path(@table.id)
        expect(response).to be_successful
      end
    end

    context 'as an unauthorized user' do
      it 'redirects the page to root_path' do
        sign_in @another_user
        get table_path(@table.id)
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get table_path(@table.id)
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get table_path(@table.id)
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#edit' do
    context 'as an authorized user' do
      it 'responds successfully' do
        sign_in @user
        get edit_table_path(@table.id)
        expect(response).to be_successful
      end
    end

    context 'as an unauthorized user' do
      it 'redirects the page to root_path' do
        sign_in @another_user
        get edit_table_path(@table.id)
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get edit_table_path(@table.id)
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get edit_table_path(@table.id)
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it 'updates a table' do
        sign_in @user
        patch table_path(@table.id), params: { title: 'New Table Name', table_size: 1 }
        expect(@table.reload.title).to eq 'New Table Name'
      end
    end

    context 'as an unauthorized user' do
      it 'does not update the table' do
        sign_in @another_user
        patch table_path(@table.id), params: { title: 'New Table Name', table_size: 1 }
        expect(@table.reload.title).to eq '新しい作業割当'
      end

      it 'redirects the page to root_path' do
        sign_in @another_user
        patch table_path(@table.id), params: { title: 'New Table Name', table_size: 1 }
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        patch table_path(@table.id), params: { title: 'New Table Name', table_size: 1 }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        patch table_path(@table.id), params: { title: 'New Table Name', table_size: 1 }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#destroy' do
    context 'as an authorized user' do
      it 'deletes a table' do
        sign_in @user
        expect { delete table_path(@table.id) }.to change(@user.tables, :count).by(-1)
      end
    end

    context 'as an unauthorized user' do
      it 'does not delete the project' do
        sign_in @another_user
        expect { delete table_path(@table.id) }.to_not change(Table, :count)
      end

      it 'redirects the page to root_path' do
        sign_in @another_user
        delete table_path(@table.id)
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      it 'does not delete the table' do
        expect { delete table_path(@table.id) }.to_not change(Table, :count)
      end

      it 'returns a 302 response' do
        delete table_path(@table.id)
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        delete table_path(@table.id)
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
