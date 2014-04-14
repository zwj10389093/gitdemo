class Employee < ActiveRecord::Base
  attr_accessible :age, :nbirth, :bumen, :eid, :nintodepartmentdate, :marriage, :name, :nation, :pay, :remark, :sex, :nworkdate
  validates :age, :nbirth, :bumen, :eid, :nintodepartmentdate, :marriage, :name, :nation, :pay, :remark, :sex, :nworkdate, presence: true
  validates :eid, uniqueness: true
  validates :age, numericality: {greater_than_or_equal_to: 1}
  belongs_to :department
  attr_accessible :department_id
  attr_accessible :department

end
