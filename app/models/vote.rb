class Vote < ActiveRecord::Base
  attr_accessible :up_down, :link_id
  belongs_to :link
  validates :up_down, :link_id, :presence => true
end
