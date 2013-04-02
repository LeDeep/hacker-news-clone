require 'spec_helper'

describe User do

  context 'validations' do 
    it {should validate_uniqueness_of(:email)}
  end

end
