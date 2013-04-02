require 'spec_helper'

describe Link do 
  context '#initialize' do 
    it 'initializes with a url' do 
      Link.new(:url => "www.whatever.com", :description => 'test').should be_an_instance_of Link
    end
  end

  context 'validations' do 
    it {should validate_presence_of :url}
    it {should validate_presence_of :description}
    it {should allow_mass_assignment_of :url}
    it {should allow_mass_assignment_of :description}
    it {should allow_value('http://www.google.com').for :url}
    it {should_not allow_value('garbage').for :url}
  end

  context 'associations' do 
    it {should have_many :votes}
  end

  context '#count_votes' do
    let(:valid_link) {Link.create!(:url => "http://www.whatever.com", :description => 'test')}
    let(:link_with_vote) {valid_link.votes.create!({:link_id => valid_link.id, :up_down => 1})}
    
    it 'counts the number of votes' do
      link = valid_link
      vote = link_with_vote
      link.count_votes.should eq 1
    end
  end
end