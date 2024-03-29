require 'spec_helper'

describe Vote do 
  context 'associations' do 
    it {should belong_to :link}
  end

  context 'validations' do 
    it {should validate_presence_of :up_down}
    it {should validate_presence_of :link_id}
    it {should allow_mass_assignment_of :up_down}
  end


end