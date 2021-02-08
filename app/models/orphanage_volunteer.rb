class OrphanageVolunteer < ApplicationRecord
    belongs_to :orphanage
    belongs_to :volunteer

end
