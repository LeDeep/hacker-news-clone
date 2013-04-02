require 'spec_helper'

describe UsersController do
  context 'routes' do 
    it {should route(:get, '/users/new').to :action => :new}
    it {should route(:post, '/users').to :action => :create}
    it {should route(:get, '/users/1').to :action => :show, :id => 1}
    it {should route(:get, '/users').to :action => :index}
    it {should route(:delete, '/users/1').to :action => :destroy, :id => 1}
  end

  context 'GET new' do
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
      let(:valid_attributes) {{:email => 'person@email.com', :password => 'supersecret', :password_confirmation => 'supersecret'}}
      let(:valid_parameters) {{:user => valid_attributes}}

    context 'with valid parameters' do

      before {post :create, valid_parameters}
      it {should redirect_to root_url}
      it {should set_the_flash[:notice]}
    end

    context 'User count' do
      it 'creates a new user' do 
        expect {post :create, valid_parameters}.to change(User, :count).by(1)
      end
    end
  end

end
