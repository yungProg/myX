class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :likes
      t.string :author_id
      t.string :integer

      t.timestamps
    end
  end
end
