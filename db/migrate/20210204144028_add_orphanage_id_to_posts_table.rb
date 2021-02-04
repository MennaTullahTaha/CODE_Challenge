class AddOrphanageIdToPostsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :orphanage_id, :int
  end
end
