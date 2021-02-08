class Volunteer < ApplicationRecord

    has_many :orphanage_volunteers, :dependent => :destroy

    has_many :orphanages, :through => :orphanage_volunteers, :source => :orphanages

    before_validation :ensure_email_is_downcase

    PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

    validates :first_name, presence: true, length: { minimum: 4, maximum: 50 }

    validates :last_name, presence: true, length: { minimum: 4, maximum: 50 }

    validates :street_address, presence: true, length: { minimum: 5, maximum: 50 }

    validates :phone_number,presence: true,
                 format: {with: PHONE_REGEX},
                 :length => { :minimum => 10, :maximum => 15 },
                 uniqueness: true

    validates :email, presence: true, uniqueness: true, length: {maximum:102}, format: {with: URI::MailTo::EMAIL_REGEXP} #TODO add index to anything with uniqueness

    validates :job, presence: true, length: {minimum: 5, maximum: 20}
    
    validates :password, :presence =>true, :confirmation =>true

    validates_confirmation_of :password

    validate :governorate_was_selected

    has_secure_password

    validates :birth_date, :presence => true

    validate :validate_age

  private

  def validate_age
      if birth_date.present? && birth_date >= 15.years.ago.to_date && birth_date <= 80.years.from_now.to_date
          errors.add(:birth_date, 'You should be over 15 years old and younger than 95 years old.')
      end
  end

    def governorate_was_selected
        if GOVERNORATES.nil?
            errors.add(:governorate, "governorate can't be empty")
            return 
        end
        if GOVERNORATES.include? governorate == false
            errors.add(:governorate, "governorate must be selected from given options")
        end
    end 

    def ensure_email_is_downcase
        email.downcase! if email
    end

end
