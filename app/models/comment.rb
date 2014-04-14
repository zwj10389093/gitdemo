class Comment < ActiveRecord::Base
  attr_accessible :ctime, :forum_id, :message, :name
  validates :message, presence: true
  belongs_to :forum 
end
