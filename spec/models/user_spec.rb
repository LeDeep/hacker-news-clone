require 'spec_helper'

describe User do

  context 'validations' do 
    it {should validate_uniqueness_of(:email)}
    it {should allow_mass_assignment_of :email}
  end

end
