require 'spec_helper'

describe Link do 
  context '#initialize' do 
    it 'initializes with a url' do 
      Link.new(:url => "www.whatever.com").should be_an_instance_of Link
    end
  end

  context 'validations' do 
    it {should validate_presence_of :url}
    it {should allow_mass_assignment_of :url}
  end


end