require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

	test "Employee attributes must not be empty" do
		employee = Employee.new
		assert employee.invalid?
		assert employee.errors[:age].any?
		assert employee.errors[:birth].any?
		assert employee.errors[:department].any?
		assert employee.errors[:eid].any?
		assert employee.errors[:intodepartmentdate].any?
		assert employee.errors[:marriage].any?
		assert employee.errors[:name].any?
		assert employee.errors[:nation].any?
		assert employee.errors[:pay].any?
		assert employee.errors[:remark].any?
		assert employee.errors[:sex].any?
		assert employee.errors[:workdate].any?
		
  # test "the truth" do
  #   assert true
  # end
end
