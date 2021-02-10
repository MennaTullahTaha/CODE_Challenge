class PagesController < ApplicationController
    def home
        redirect_to posts_path if logged_in?
    end

    def FAQS
    end 

    def eligibility_criteria
    end 

    def procedures_documents_required
    end 

    def what_is_kafala
    end

    def kafala_stories
    end

    def shaymaa_story
    end 

    def yasmin_story
    end 

    def sara_story
    end

    def fatma_story
    end 

    def marwa_story
    end

    def hamza_story
    end 
end
