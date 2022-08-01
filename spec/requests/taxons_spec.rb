require 'rails_helper'

RSpec.describe "Taxons", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @taxon = FactoryBot.create(:taxon)
  end

  describe "#show" do
    context "as an authorized user" do
      it "responds successfully" do
        sign_in @user
        get taxon_path(@taxon.id)
        expect(response).to be_successful
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get taxon_path(@taxon.id)
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get taxon_path(@taxon.id)
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
