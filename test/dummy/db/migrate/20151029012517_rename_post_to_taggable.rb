class RenamePostToTaggable < ActiveRecord::Migration
  def change
    rename_table :posts, :taggables
  end
end
