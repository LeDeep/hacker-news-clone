require 'spec_helper'

describe Link do 
  context 'validations' do 
    it {should validate_presence_of :url}
    it {should validate_presence_of :description}
    it {should allow_mass_assignment_of :url}
    it {should allow_mass_assignment_of :description}
    it {should have_many :votes}
    it {should allow_value('http://www.google.com').for(:url)}
    it {should_not allow_value('www.google.com').for(:url)}
  end

  context '#count_votes' do 
    it 'counts the votes for a given link' do
      link = FactoryGirl.create(:link_with_votes)
      link.count_votes.should eq link.votes.count
    end
  end
end
