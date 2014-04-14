class AddNumberToForum < ActiveRecord::Migration
  def change
    add_column :forums, :number, :integer
  end
end
