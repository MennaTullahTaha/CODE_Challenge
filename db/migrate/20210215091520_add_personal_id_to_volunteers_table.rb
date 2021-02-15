class AddPersonalIdToVolunteersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :personal_id, :string
  end
end
