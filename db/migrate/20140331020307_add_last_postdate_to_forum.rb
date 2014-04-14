class AddLastPostdateToForum < ActiveRecord::Migration
  def change
    add_column :forums, :last_postdate, :datetime
  end
end
