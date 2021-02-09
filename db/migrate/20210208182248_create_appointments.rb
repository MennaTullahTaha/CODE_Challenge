class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :choosen_day
      t.text :note
      t.integer :available_from
      t.integer :available_until
      t.boolean :approved_by_orphanage, :default => false
      t.string :volunteer_name
      t.integer :appointment_time
      t.integer :orphanage_volunteer_id
      t.timestamps
    end
  end
end
