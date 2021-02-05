class OrphanagesController < ApplicationController

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
    
    end

    def show
    
    end

    def edit
    
    end

    def update

    end 

    def destroy
    
    end

    private

    def orphanage_params
        params.require(:orphanage).permit(:name, :email, :password, :password_confirmation, :phone_number, :children_count,
                                          :street_address, :governorate, :accepts_new_cases, :bio)
    end 
end
