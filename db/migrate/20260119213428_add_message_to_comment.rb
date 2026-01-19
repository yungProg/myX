class AddMessageToComment < ActiveRecord::Migration[8.1]
  def change
    add_column :comments, :message, :text
  end
end
