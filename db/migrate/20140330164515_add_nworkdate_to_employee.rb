class AddNworkdateToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :nworkdate, :date
  end
end
