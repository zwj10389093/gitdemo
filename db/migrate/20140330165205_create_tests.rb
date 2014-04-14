class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.date :time

      t.timestamps
    end
  end
end
