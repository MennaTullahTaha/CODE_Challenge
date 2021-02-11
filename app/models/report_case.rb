class ReportCase < ApplicationRecord

    belongs_to: volunteer

    validates :street_address, presence: true, length: { minimum: 5, maximum: 50 }

    validate :governorate_was_selected

    validates :description, :presence => true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }

    validates :health_state, :presence => true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }


    private

    def governorate_was_selected
        if GOVERNORATES.nil?
            errors.add(:governorate, "governorate can't be empty")
            return 
        end
        if GOVERNORATES.include? governorate == false
            errors.add(:governorate, "governorate must be selected from given options")
        end
    end 


end
