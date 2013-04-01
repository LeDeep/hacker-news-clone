require 'spec_helper'

describe LinksController do 
  context 'routing' do
    it {should route(:get, '/links/new').to :action => :new}
    it {should route(:post, '/links').to :action => :create}
    it {should route(:get, '/links/1').to :action => :show, :id => 1}
    it {should route(:get, '/links/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/links/1').to :action => :update, :id => 1}
    it {should route(:delete, '/links/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/links').to :action => :index}
  end

  context 'GET new' do 
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:valid_attributes) {{:url => 'http://www.lkwejrl.com', :description => 'cool article'}}
      let(:valid_parameters) {{:link => valid_attributes}}

      it 'creates a new link' do 
        expect {post :create, valid_parameters}.to change(Link, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should redirect_to links_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do 
      let(:invalid_attributes) {{:url => '', :description => ''}}
      let(:invalid_parameters) {{:link => invalid_attributes}}
      before {post :create, invalid_parameters}

      it {should render_template :new}
    end
  end

  context 'GET index' do 
    before {get :index}

    it {should render_template :index}
  end  
end




























