class Link<ActiveRecord::Base
  attr_accessible :url, :description
  validates :url, format: {with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix}
  validates :url, :description, :presence => true
  has_many :votes

  def count_votes
    sum = 0
    self.votes.each {|vote| sum += vote.up_down }
    sum
  end
end