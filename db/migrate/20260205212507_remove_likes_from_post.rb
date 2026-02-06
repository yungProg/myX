class RemoveLikesFromPost < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :likes
  end
end
