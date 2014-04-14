class AddBumenToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :bumen, :string
  end
end
