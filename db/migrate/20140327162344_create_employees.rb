class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :eid
      t.string :name
      t.string :sex
      t.integer :age
      t.string :marriage
      t.string :nation
      t.string :department
      t.string :birth
      t.string :workdate
      t.string :intodepartmentdate
      t.integer :pay
      t.text :remark

      t.timestamps
    end
  end
end
