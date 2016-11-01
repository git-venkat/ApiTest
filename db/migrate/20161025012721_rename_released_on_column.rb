class RenameReleasedOnColumn < ActiveRecord::Migration
  def change
  	rename_column :products, :released_on, :released_at
  	change_column :products, :released_at, :datetime
  end
end
