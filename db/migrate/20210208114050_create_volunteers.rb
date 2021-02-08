class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :phone_number
      t.string :email
      t.date :birth_date
      t.string :job
      t.string :password_digest
      t.string :governorate

      t.timestamps
    end
  end
end
