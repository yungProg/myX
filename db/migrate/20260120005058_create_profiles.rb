class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.datetime :date_of_birth
      t.string :pfp
      t.string :location

      t.timestamps
    end
  end
end
