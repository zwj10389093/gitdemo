class AddNbirthToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :nbirth, :date
  end
end
