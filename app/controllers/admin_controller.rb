class AdminController < ApplicationController
  def index
  	@total_employees = Employee.count
  	@total_departments = Department.count
  end
end
