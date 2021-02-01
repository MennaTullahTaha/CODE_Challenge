class Post < ApplicationRecord

    validates :title, presence: true, length: { minimum: 10, maximum: 300 }

    validates :body, presence: true,  length: { minimum: 300, too_short: "%{count} characters is less than the minimum allowed" }

    validate :category_must_be_from_list

    def category_must_be_from_list
        if category.nil?
            errors.add(:category, "category can't be empty")
            return 
        end
        if CATEGORIES.include? cateogry
            errors.add(:cateogry, "cateogry must be selected from given options")
        end
    end 


end
