class SessionsController < ApplicationController 

    def new_orphanage
        if logged_in?
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

    def destroy
        if logged_in? && current_user.class.name == "Orphanage"
            session[:orphanage_id] = nil
        end
        flash[:notice] = "Logged out"
        redirect_to root_path
    end 

end 