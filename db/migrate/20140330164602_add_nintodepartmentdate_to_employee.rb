class AddNintodepartmentdateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :nintodepartmentdate, :date
  end
end
