class CreateOrphanages < ActiveRecord::Migration[6.0]
  def change
    create_table :orphanages do |t|
      t.string :name
      t.string :street_address
      t.string :phone_number
      t.string :email
      t.integer :children_count
      t.boolean :accepts_new_cases, :default => false
      t.text :bio
      t.string :password_digest
      t.boolean :verified, :default => false
      t.string :governorate

      t.timestamps
    end
  end
end
