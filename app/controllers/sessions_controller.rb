class SessionsController < ApplicationController 

    def new_orphanage
        if logged_in? && current_user.class.name == "Orphanage"
            flash[:alert] = "You are already logged in."
            redirect_to orphanage_path(current_user)
        end  
    end 

    def create_orphanage 
        orphanage = Orphanage.find_by(email: params[:session][:email].downcase)
        if orphanage && orphanage.authenticate(params[:session][:password])
            session[:orphanage_id] = orphanage.id
            flash[:notice] = "Logged in successfully"
            redirect_to orphanage
        else  
            flash.now[:alert] = "Either your email or password is incorrect."
            render 'new_orphanage'
        end 
    end 

    def new_volunteer
        if logged_in? && current_user.class.name == "Volunteer"
            flash[:alert] = "You are already logged in."
            redirect_to volunteer_path(current_user)
        end 
    end

    def create_volunteer
        volunteer = Volunteer.find_by(email: params[:session][:email].downcase)
        if volunteer && volunteer.authenticate(params[:session][:password])
            session[:volunteer_id] = volunteer.id
            flash[:notice] = "Logged in successfully"
            redirect_to volunteer
        else  
            flash.now[:alert] = "Either your email or password is incorrect."
            render 'new_volunteer'
        end 
    end

    def destroy
        if logged_in? && current_user.class.name == "Orphanage"
            session[:orphanage_id] = nil
        elsif logged_in? && current_user.class.name == "Volunteer"
            session[:volunteer_id] = nil
        end
        flash[:notice] = "Logged out"
        redirect_to root_path
    end 

end 