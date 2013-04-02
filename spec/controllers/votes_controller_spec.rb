require 'spec_helper'

describe VotesController do
  context 'routes' do
    it {should route(:get, '/votes/new').to :action => :new}
    it {should route(:post, '/votes').to :action => :create}
    it {should route(:get, '/votes/1').to :action => :show, :id => 1}
    it {should route(:get, '/votes').to :action => :index}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:user) {FactoryGirl.create(:user)}
      let(:link) {FactoryGirl.create(:link)}
      let(:valid_attributes) {{:link_id => link.id, :vote => {:up_down => 1}}}  

      it 'creates a new vote' do 
        expect {post :create, valid_attributes, {:user_id => user.id}}.to change(Vote, :count).by(1)
      end

      before {post :create, valid_attributes, {:user_id => user.id}}
      it {should redirect_to links_path}
      it {should set_the_flash[:notice]}
    end
  end
end
