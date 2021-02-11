class ReportCasesController < ApplicationController

    before_action :logged_in?
    before_action :require_volunteer, only: [:new, :create ]
    before_action :require_orphanage, only: [:view_pending_cases, :accept_case]
    
    def new 
        @case = ReportCase.new
    end 

    def create 
        @case = ReportCase.new(set_params)
        @case.volunteer = current_user
        if @case.save
            flash[:notice] = "Case was reported successfully, you could check whether an orphanage accepted the case through reported cases page."
            redirect_to @case
        else  
            render 'new'
        end
    end 

    def show 
        if @case.volunteer == current_user || current_user.class.name == "Orphanage"
            @case = ReportCase.find(params[:id])
        else 
            flash[:alert] = "You don't have permission to view this page."
            redirect_to root_path
    end 

    def volunteer_reported_cases
    end 

    def view_pending_cases
    end 

    def orphanage_accepted_cases
    end 

    def accept_case 
    end 

    private 

    def set_params
        params.require(:report_case).permit(:name, :street_address, :governorate, :approximate_age, :health_state, :description, :note)
    end 

end
