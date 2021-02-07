class OrphanagesController < ApplicationController

    before_action :set_orphanage, except: [:index, :new, :create]
    before_action :require_orphanage, except: [:show, :index]
    before_action :require_same_orphanage, only: [:edit, :update, :destroy]


    def new 
        if logged_in? == false
            @orphanage = Orphanage.new
        else 
            flash[:alert] = "Your orphanage already has an account."
            redirect_to orphanages_path
        end
    end 

    def create
        @orphanage = Orphanage.new(orphanage_params)
        if @orphanage.save
            session[:orphanage_id] = @orphanage.id
            flash[:notice] = "You have signed up successfully!"
            redirect_to posts_path
        else
            render 'new' 
        end 
    end

    def index
        @orphanages = Orphanage.paginate(page: params[:page], per_page: 5)
    end

    def show
    end

    def edit
    end

    def update
        if @orphanage.update(orphanage_params)
            flash[:notice] = "Orphanage was updated successfully."
            redirect_to @orphanage
        else
            render 'edit' 
        end   
    end 

    def destroy
        @orphanage.destroy
        session[:orphanage_id] = nil
        flash[:notice] = "Account and all associated posts have been deleted successfully."
        redirect_to root_path
    end

    private

    def orphanage_params
        params.require(:orphanage).permit(:name, :email, :password, :password_confirmation, :phone_number, :children_count,
                                          :street_address, :governorate, :accepts_new_cases, :bio)
    end 

    def set_orphanage
        @orphanage = Orphanage.find(params[:id])
    end 

    def require_same_orphanage
        if current_user.class.name == "Orphanage"
            if current_user != @orphanage
                flash[:alert] = "This account is permitted to only edit or delete its own data."
                redirect_to orphanages_path
            end 
        else 
            flash[:alert] = "You aren't permitted to perfom this action."
            redirect_to orphanages_path
        end 
    end
end
