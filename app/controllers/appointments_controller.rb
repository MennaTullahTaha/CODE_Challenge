class AppointmentsController < ApplicationController
    before_action :require_volunteer, only: [:new, :create]
    before_action :require_orphanage, only: [:pending_appointments]

    def new
        @appointment = Appointment.new
        @orphanages = Orphanage.all
    end 

    def create
        @orphanages = Orphanage.all
        @appointment = Appointment.new(appointment_params.except(:orphanage))
        @orphanage = Orphanage.find(params[:appointment][:orphanage])
        @appointment.volunteer_name = current_user.first_name + " " + current_user.last_name
        record = @orphanage_volunteer = OrphanageVolunteer.find_by(orphanage_id: params[:appointment][:orphanage], volunteer_id: current_user.id)
        if !record
            @orphanage.volunteers << current_user
            @orphanage_volunteer = OrphanageVolunteer.find_by(orphanage_id: params[:appointment][:orphanage], volunteer_id: current_user.id)
            record = @orphanage_volunteer = OrphanageVolunteer.find_by(orphanage_id: params[:appointment][:orphanage], volunteer_id: current_user.id)
        end
        @appointment.orphanage_volunteer = record
        if @appointment.save
            flash[:notice] = "Your appointment is pending approval"
            redirect_to orphanages_path
        else
            render 'new'
        end 
        
    end 

    def pending_appointments
        @orphanage_volunteers = OrphanageVolunteer.where(orphanage_id: current_user.id)
        @orphanage_volunteers.each do |ov|
            ov.appointments.paginate(page: params[:page], per_page: 5)
        end
    end

    def cancel_appointment
    end

    private

    def appointment_params
        params.require(:appointment).permit(:choosen_day, :available_from, :available_until, :note, :orphanage)
    end 


end
