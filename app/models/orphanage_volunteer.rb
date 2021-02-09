class OrphanageVolunteer < ApplicationRecord
    belongs_to :orphanage
    belongs_to :volunteer
    has_many :appointments, foreign_key: "orphanage_volunteer_id", dependent: :destroy
    validates :orphanage_id, presence: true
    validates :volunteer_id, presence: true
end
