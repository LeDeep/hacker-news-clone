require 'spec_helper'

describe SessionsController do

  context "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  context 'POST create' do
    context 'with valid parameters' do
      let(:user) {FactoryGirl.create(:user)}
      before {post :create, {:email => user.email, :password => user.password}}
      
      it {should set_session(:user_id).to(user.id)}


      it {should redirect_to root_url}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do 
      before {post :create, {:email => '', :password => ''}}
      
      it {should redirect_to new_session_path}
      it {should set_the_flash[:alert].to('Email or password is invalid.')}
    end
  end

  context 'DELETE destroy' do 
    let(:user) {FactoryGirl.create(:user)}
    before {post :create, {:email => user.email, :password => user.password}}
    before {delete :destroy, {:id => user.id}}

    it {should set_session(:user_id).to(nil)}
    it {should redirect_to root_url}
    it {should set_the_flash[:alert].to('Logged out!')}
  end
end
