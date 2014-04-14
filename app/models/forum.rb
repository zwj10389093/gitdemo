class Forum < ActiveRecord::Base
  attr_accessible :number, :createtime, :fcontent, :postuser, :title, :last_postdate
  validates :title, :fcontent, presence: true
  has_many :comments, dependent: :destroy
end
