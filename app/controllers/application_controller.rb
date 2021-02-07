class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= Orphanage.find(session[:orphanage_id]) if session[:orphanage_id]      
     end 

    def logged_in?
        !!current_user
    end 

    def require_orphanage
        if !logged_in?
            flash[:alert] = "You must be logged in to perfom that action"
            redirect_to orphanages_login_path
        elsif logged_in? && current_user.class.name == "Volunteer"
            flash[:alert] = "You don't have access to perform this action"
            redirect_to posts_path
        end 
    end 
end
