class OrphanageVolunteersController < ApplicationController
 
    def volunteer_activities
        if logged_in? && current_user.class.name == "Volunteer"
            @orphanages = current_user.orphanages.paginate(page: params[:page], per_page: 5)
        else 
            flash[:alert] = "You need to be logged in with volunteer account to view this page."
            redirect_to root_path
        end
    end 

    def current_volunteers
        if logged_in? && current_user.class.name == "Orphanage"
            @volunteers = current_user.volunteers.paginate(page: params[:page], per_page: 5)
        else 
            flash[:alert] = "You need to be logged in with orphanage account to view this page."
            redirect_to root_path
        end

    end 

end
