class AppointmentsController < ApplicationController
    before_action :require_volunteer, only: [:new, :create]
    before_action :retrieve_orphanages, only: [:new, :create]
    before_action :require_orphanage, only: [:pending_appointments, :approve_appointment, :cancel_appointment]
    before_action :require_same_orphanage, only: [:approve_appointment, :cancel_appointment]
    before_action :set_appointment, only: [:approve_appointment, :cancel_appointment]

    def new
        @appointment = Appointment.new
    end 

    def create
        @appointment = Appointment.new(appointment_params.except(:orphanage))
        @orphanage = Orphanage.find(params[:appointment][:orphanage])
        @appointment.orphanage = @orphanage
        @appointment.volunteer = current_user
        if @appointment.save
            flash[:notice] = "Your appointment is pending approval"
            redirect_to orphanages_path
        else
            render 'new'
        end 
        
    end 

    def pending_appointments
        @orphanage = Orphanage.find(current_user.id)
        @appointments = @orphanage.appointments.where(approved_by_orphanage: false).paginate(page: params[:page], per_page: 5)
    end

    def approve_appointment
        if @appointment
            if @appointment.choosen_day.to_date > Time.now.to_date
                @appointment.approved_by_orphanage = true;
                @appointment.save
                if !OrphanageVolunteer.find_by(orphanage_id: current_user.id, volunteer_id: @appointment.volunteer_id)
                    @orphanage = @appointment.orphanage
                    @volunteer = @appointment.volunteer
                    @orphanage.volunteers << @volunteer
                end
                flash[:notice] = "Appointment approved"
                redirect_to view_current_volunteers_path
            else 
                @appointment.destroy
                flash[:alert] = "Appointment can't be approved"
            end 
        else 
            flash[:alert] = "Appointment not found"
            redirect_to view_pending_appointments_path
        end 
    end

    def cancel_appointment
        if @appointment 
            @appointment.approved_by_orphanage = false
            @appointment.save
            @record = Appointment.find_by(orphanage_id:@appointment.orphanage_id, volunteer_id: @appointment.volunteer_id, approved_by_orphanage: true)
            if !@record
                @orphanage = @appointment.orphanage
                if OrphanageVolunteer.find_by(orphanage_id: @orphanage.id, volunteer_id: @appointment.volunteer_id)
                    @volunteer = @orphanage.volunteers.find(@appointment.volunteer_id)
                    @orphanage.volunteers.delete(@volunteer)
                end 
            end
            @appointment.destroy
            redirect_to view_pending_appointments_path
        else 
            flash[:alert] = "Appointment not found"
            redirect_to view_pending_appointments_path
        end
    end

    def approved_appointments
        @appointments = current_user.appointments.where(approved_by_orphanage: true).paginate(page: params[:page], per_page: 5)
    end

    private

    def appointment_params
        params.require(:appointment).permit(:choosen_day, :available_from, :available_until, :note, :orphanage)
    end 

    def require_same_orphanage
        if current_user.class.name == "Orphanage"
            if @appointment && current_user != @appointment.orphanage
                flash[:alert] = "This account is permitted to only edit or delete posts created by it."
                redirect_to @appointment
            end 
        else 
            flash[:alert] = "You aren't permitted to perfom this action."
            redirect_to @appointment
        end 
    end

    def retrieve_orphanages 
        @orphanages = Orphanage.all
    end

    def set_appointment
        @appointment = Appointment.find(params[:appointment_id])
    end 

end
