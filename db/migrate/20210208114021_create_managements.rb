class CreateManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :orphanage_volunteers do |t|
      t.integer :orphanage_id
      t.integer :volunteer_id

      t.timestamps
    end
  end
end
