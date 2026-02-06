class AddUniquenessConstrainToLike < ActiveRecord::Migration[8.1]
  def change
    add_index :likes, [ :user_id, :post_id ], unique: true
    # Ex:- add_index("admin_users", "username")
  end
end
