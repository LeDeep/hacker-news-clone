class Link<ActiveRecord::Base
  attr_accessible :url, :description
  validates :url, format: {with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix}
  validates :url, :presence => true
  validates :description, :presence => true 
end