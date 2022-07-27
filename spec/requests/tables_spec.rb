require 'rails_helper'

RSpec.describe "Tables", type: :request do
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get tables_path
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get tables_path
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get tables_path
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#show" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @table = FactoryBot.create(:table, user: @user)
      end

      it "responds successfully" do
        sign_in @user
        get tables_path(:id), params: { id: @table.id }
        expect(response).to be_successful
      end
    end

    context "as an unauthorized user" do
      #追加予定
    end
  end

  describe "#new" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @table = FactoryBot.create(:table, user: @user)
      end

      it "responds successfully" do
        sign_in @user
        get new_table_path
        expect(response).to be_successful
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get new_table_path
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get new_table_path
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe"#create"do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "adds a table" do
        table_params = FactoryBot.attributes_for(:table)
        sign_in @user
        expect {
          post tables_path, params: { table: table_params }
        }.to change(@user.tables, :count).by(1)
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        table_params = FactoryBot.attributes_for(:table)
        post tables_path, params: { table: table_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        table_params = FactoryBot.attributes_for(:table)
        post tables_path, params: { table: table_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe"#update"do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @table = FactoryBot.create(:table, user: @user)
      end

      it "updates a table" do
        table_params = FactoryBot.attributes_for(:table, title: "New Table Name")
        sign_in @user
        patch table_path(@table.id), params: { table: table_params }
        expect(@table.reload.title).to eq "New Table Name"
      end
    end

    context "as a guest" do
      before do
        @user = FactoryBot.create(:user)
        @table = FactoryBot.create(:table, user: @user)
      end

      it "returns a 302 response" do
        table_params = FactoryBot.attributes_for(:table)
        patch table_path(@table.id), params: { table: table_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        table_params = FactoryBot.attributes_for(:table)
        patch table_path(@table.id), params: { table: table_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe"#destroy"do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @table = FactoryBot.create(:table, user: @user)
      end

      it "deletes a table" do
        sign_in @user
        expect {delete table_path(@table.id)}.to change(@user.tables, :count).by(-1)
      end
    end

    context "as a guest" do
      before do
        @user = FactoryBot.create(:user)
        @table = FactoryBot.create(:table, user: @user)
      end

      it "returns a 302 response" do
        delete table_path(@table.id)
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        delete table_path(@table.id)
        expect(response).to redirect_to "/users/sign_in"
      end

      it "does not delete the table" do
        expect {delete table_path(@table.id)}.to_not change(Table, :count)
      end
    end
  end
end
