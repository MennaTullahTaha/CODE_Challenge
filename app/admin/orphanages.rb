ActiveAdmin.register Orphanage do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :street_address, :phone_number, :email, :children_count, :accepts_new_cases, :bio, :password, :verified, :governorate
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :street_address, :phone_number, :email, :children_count, :accepts_new_cases, :bio, :password_digest, :verified, :governorate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "Admin Details" do
    f.input :email
    f.input :password
    f.input :phone_number
    f.input :email
    f.input :children_count
    f.input :accepts_new_cases
    f.input :bio
    f.input :verified
    f.input :governorate
    end
    f.actions
  end
  

end
