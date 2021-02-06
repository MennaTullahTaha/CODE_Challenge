class OrphanagesController < ApplicationController

    before_action :set_orphanage, except: [:index, :new, :create]

    def new 
        @orphanage = Orphanage.new
    end 

    def create
        @orphanage = Orphanage.new(orphanage_params)
        if @orphanage.save
            flash[:notice] = "You have signed up successfully!"
            redirect_to posts_path
        else
            render 'new' 
        end 
    end

    def index
        @orphanages = Orphanage.all
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
    
    end

    private

    def orphanage_params
        params.require(:orphanage).permit(:name, :email, :password, :password_confirmation, :phone_number, :children_count,
                                          :street_address, :governorate, :accepts_new_cases, :bio)
    end 

    def set_orphanage
        @orphanage = Orphanage.find(params[:id])
    end 
end
