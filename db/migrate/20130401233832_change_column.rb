class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :votes, :votable_id, :links_id
    remove_column :votes, :votable_type
  end
end
