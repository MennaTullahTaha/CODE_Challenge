class ReportCasesController < ApplicationController

    before_action :logged_in?
    before_action :require_volunteer, only: [:new, :create, :volunteer_reported_cases]
    before_action :require_orphanage, only: [:view_pending_cases, :accept_case, :mark_as_resolved]
    before_action :set_case, only: [:accept_case, :mark_as_resolved]
    
    def new 
        @case = ReportCase.new
    end 

    def create 
        @case = ReportCase.new(set_params)
        @case.volunteer = current_user
        if @case.save
            flash[:notice] = "Case was reported successfully, you could check whether an orphanage accepted the case through reported cases page."
            redirect_to view_reported_cases_path
        else  
            render 'new'
        end
    end 

    def volunteer_reported_cases
        @cases = current_user.report_cases.paginate(page: params[:page], per_page: 5)
    end 

    def view_pending_cases
        if current_user.accepts_new_cases
            @cases = ReportCase.where(case_accepted: false).paginate(page: params[:page], per_page: 5)
        else 
            flash[:alert] = "Edit your account so that it can accept new cases in order to view this page."
            redirect_to view_pending_cases_path
        end 
    end 

    def orphanage_accepted_cases
        @cases = ReportCase.where(orphanage_id: current_user.id, case_resolved: false).paginate(page: params[:page], per_page: 5)   
    end 

    def orphanage_resolved_cases
        @cases = ReportCase.where(orphanage_id: current_user.id, case_resolved: true).paginate(page: params[:page], per_page: 5)   
    end

    def accept_case 
        @case.case_accepted = true;
        @case.orphanage_id = current_user.id
        if @case.save
            flash[:notice] = "Your orphanage has accepted the case and it will be added to the accepted cases page."
            redirect_to accepted_cases_path
        else 
            flash[:alert] = "Case couldn't be accepted."
            redirect_to view_pending_cases_path
        end
    end 

    def mark_as_resolved
       if @case.orphanage_id == current_user.id 
            @case.case_resolved = true
            @case.save
            flash[:notice] = "Case was marked as resolved "
            redirect_to resolved_cases_path
       else 
            flash[:alert] = "Case couldn't be accepted."
            redirect_to accepted_cases_path
       end
    end

    private 

    def set_params
        params.require(:report_case).permit(:name, :street_address, :governorate, :approximate_age, :health_state, :description, :note)
    end 

    def set_case
        @case = ReportCase.find(params[:case_id]) 
    end


end
