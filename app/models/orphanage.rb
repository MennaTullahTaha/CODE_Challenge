class Orphanage < ApplicationRecord

    has_many :posts

    before_validation :ensure_email_is_downcase

    PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: {case_sensitive: false}

    validates :street_address, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: {case_sensitive: false}

    validates :bio, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }

    validates :phone_number,presence: true,
                 format: {with: PHONE_REGEX},
                 :length => { :minimum => 10, :maximum => 15 },
                 uniqueness: true

    validates :email, presence: true, uniqueness: true, length: {maximum:102}, format: {with: URI::MailTo::EMAIL_REGEXP} #TODO add index to anything with uniqueness

    validates :children_count,presence: true, :numericality => true

    validates :accepts_new_cases, presence: true

    validate :governorate_was_selected

    has_secure_password

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
