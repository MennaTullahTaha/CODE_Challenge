class VolunteersController < ApplicationController
    
    before_action :set_volunteer, except: [:index, :new, :create]
    before_action :require_volunteer, only: [:edit, :update, :destroy]
    before_action :require_same_volunteer, only: [:edit, :update, :destroy]


    def new 
        if logged_in? == false
            @volunteer = Volunteer.new
        else 
            flash[:alert] = "You already have an account."
            redirect_to volunteers_path
        end
    end 

    def create
        @volunteer = Volunteer.new(volunteer_params)
        if @volunteer.save
            session[:volunteer_id] = @volunteer.id
            flash[:notice] = "You have signed up successfully!"
            redirect_to orphanages_path
        else
            render 'new' 
        end 
    end

    def index
        if logged_in? && current_user.class.name != "Volunteer" && current_user.class.name != "Orphanage"
            @volunteers = Volunteer.paginate(page: params[:page], per_page: 5)
        else 
            flash[:alert] = "You aren't permitted to view this page."
            redirect_to root_path
        end 
    end

    def show
        if logged_in? && (current_user != @volunteer && current_user.class.name != "Orphanage")
            flash[:alert] = "You aren't permitted to view this page."
            redirect_to root_path
        end
    end

    def edit
    end

    def update
        if @volunteer.update(volunteer_params.except(:personal_id))
            flash[:notice] = "Volunteer was updated successfully."
            redirect_to @volunteer
        else
            render 'edit' 
        end   
    end 

    def destroy
        @volunteer.destroy
        session[:volunteer_id] = nil
        flash[:notice] = "Account has been deleted successfully."
        redirect_to root_path
    end

    private

    def volunteer_params
        params.require(:volunteer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :job,
                                          :street_address, :governorate, :birth_date, :personal_id)
    end 

    def set_volunteer
        @volunteer = Volunteer.find(params[:id])
    end 

    def require_same_volunteer
        if current_user.class.name == "Volunteer"
            if current_user != @volunteer
                flash[:alert] = "This account is permitted to only edit or delete or view its own data."
                redirect_to volunteers_path
            end 
        else 
            flash[:alert] = "You aren't permitted to perfom this action."
            redirect_to orphanages_path
        end 
    end
end
