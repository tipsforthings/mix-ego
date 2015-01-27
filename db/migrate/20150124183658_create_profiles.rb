class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.text :bio
      t.string :twitter

      t.timestamps null: false
    end
  end
end
