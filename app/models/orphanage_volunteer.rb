class OrphanageVolunteer < ApplicationRecord
    belongs_to :orphanage
    belongs_to :volunteer
    validates :orphanage_id, presence: true
    validates :volunteer_id, presence: true
end
