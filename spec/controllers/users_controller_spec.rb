require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  context "when user is not logged in" do
    describe "GET #index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "when user is logged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject    { FactoryGirl.create(:user) }

    before do
      sign_in user
    end

    describe "GET #index" do
      it "renders :index view" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      it "assigns to requested user to subject" do
        get :show, id: subject
        expect(assigns(:user)).to eq(subject)
      end

      it "renders the show template" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #edit" do
      it "assigns the requested user to subject" do
        get :edit, id: subject
        expect(assigns(:user)).to eq(subject)
      end

      it "renders the edit template" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

    describe "DELETE #destroy" do
      it "deletes the user" do
        expect{
          delete :destroy, id: user
        }.to change(User, :count).by(-1)
      end
    end
  end #ofLoggedInUser
end