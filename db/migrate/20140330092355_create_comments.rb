class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.datetime :ctime
      t.text :message
      t.integer :forum_id

      t.timestamps
    end
  end
end
