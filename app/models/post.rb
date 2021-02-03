class Post < ApplicationRecord

    validates :title, presence: true, length: { minimum: 10, maximum: 300 }

    validates :body, presence: true,  length: { minimum: 25 }

    validates :category, presence: true

    validate :category_must_be_from_list

    def category_must_be_from_list
        if category.nil?
            errors.add(:category, "category can't be empty")
            return 
        end
        if CATEGORIES.include? category == false
            errors.add(:category, "category must be selected from given options")
        end
    end 


end
