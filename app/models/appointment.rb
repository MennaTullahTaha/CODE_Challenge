class Appointment < ApplicationRecord

    belongs_to :orphanage

    belongs_to :volunteer

    validates :choosen_day, :presence => true

    validate :validate_choosen_day

    validate :time_correctness

    validates :available_from, :presence => true

    validates :available_until, :presence =>true

    validates :note, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }

    private

    def validate_choosen_day
        if choosen_day.present? && (choosen_day.to_date < (Time.now.to_date+ 2.days).to_date || choosen_day.to_date > (Time.now.to_date + 30.days).to_date)
            errors.add(:choosen_day, 'You need to select a date starting from 2 days from now till a month from now ')
        end
    end

    def time_correctness
        if available_from.present? && available_until.present? && available_from >= available_until
            errors.add(:available_from, 'You need to enter valid hours and make sure there is at least an hour difference between them')
        end  
    end
end
