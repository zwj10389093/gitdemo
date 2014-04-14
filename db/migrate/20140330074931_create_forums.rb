class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.text :title
      t.text :fcontent
      t.datetime :createtime
      t.string :postuser

      t.timestamps
    end
  end
end
