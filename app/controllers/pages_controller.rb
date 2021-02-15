class PagesController < ApplicationController
    def home
        if logged_in? && current_user.class.name == "Orphanage"
            redirect_to posts_path
        elsif logged_in? && current_user.class.name == "Volunteer"
            redirect_to volunteer_options_path
        end 
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

    def fatima_story
    end 

    def marwa_story
    end

    def hamza_story
    end 

    def volunteer_options
        if !logged_in? || current_user.class.name!= "Volunteer"
            flash[:alert] = "You aren't allowed to view this page"
            redirect_to posts_path
        end
    end 
end
