class Orphanage < ApplicationRecord

    has_many :orphanage_volunteers, :dependent => :destroy

    has_many :volunteers, through: :orphanage_volunteers

    has_many :appointments, foreign_key: "orphanage_id", dependent: :destroy

    has_many :posts, foreign_key: "orphanage_id", dependent: :destroy

    before_validation :ensure_email_is_downcase

    PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

    validates :name, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: {case_sensitive: false}

    validates :street_address, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: {case_sensitive: false}

    validates :bio, length: { maximum: 1500, too_long: "%{count} characters is the maximum allowed" }

    validates :phone_number,presence: true,
                 format: {with: PHONE_REGEX},
                 :length => { :minimum => 10, :maximum => 15 },
                 uniqueness: true

    validates :email, presence: true, uniqueness: true, length: {maximum:102}, format: {with: URI::MailTo::EMAIL_REGEXP} #TODO add index to anything with uniqueness

    validates :children_count,presence: true, :numericality => { :greater_than_or_equal_to => 0 }

    validates :password, :presence =>true, :confirmation =>true

    validates_confirmation_of :password

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
