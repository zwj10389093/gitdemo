class Department < ActiveRecord::Base
  attr_accessible :name, :remark
  has_many :employees
  before_destroy :ensure_not_referenced_by_any_employee

  private
  	def ensure_not_referenced_by_any_employee
  		if employees.empty?
  			return true
  		else
  			errors.add(:base, 'Employee present')
  			return false
  		end
  	end
end
