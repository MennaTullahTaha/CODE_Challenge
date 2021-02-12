ActiveAdmin.register ReportCase do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :case_resolved, :case_accepted, :street_address, :approximate_age, :description, :note, :health_state, :volunteer_id, :governorate, :orphanage_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :case_resolved, :case_accepted, :street_address, :approximate_age, :description, :note, :health_state, :volunteer_id, :governorate, :orphanage_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
