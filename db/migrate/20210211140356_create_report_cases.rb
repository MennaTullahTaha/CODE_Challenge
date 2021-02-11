class CreateReportCases < ActiveRecord::Migration[6.0]
  def change
    create_table :report_cases do |t|
      t.string :name
      t.boolean :case_resolved, :default => false
      t.string :street_address
      t.string :approximate_age
      t.text :description
      t.text :note
      t.text :health_state
      t.integer :volunteer_id
      t.string :governorate
      t.integer :orphanage_id

      t.timestamps
    end
  end
end
