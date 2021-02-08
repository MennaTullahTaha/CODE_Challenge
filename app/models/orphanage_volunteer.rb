class OrphanageVolunteer < ApplicationRecord
    belongs_to :orphanages
    belongs_to :volunteer
end
