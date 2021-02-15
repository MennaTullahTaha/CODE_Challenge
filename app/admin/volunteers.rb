ActiveAdmin.register Volunteer do

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	# Uncomment all parameters which should be permitted for assignment
	#
	permit_params :first_name, :last_name, :street_address, :phone_number, :email, :birth_date, :job, :password, :governorate, :personal_id
	#
	# or
	#
	# permit_params do
	#   permitted = [:first_name, :last_name, :street_address, :phone_number, :email, :birth_date, :job, :password_digest, :governorate]
	#   permitted << :other if params[:action] == 'create' && current_user.admin?
	#   permitted
	# end

	form do |f|
		f.inputs "Admin Details" do
			f.input :first_name
			f.input :last_name
			f.input :password
			f.input :personal_id
			f.input :phone_number
			f.input :street_address
			f.input :email
			f.input :job
			f.input :birth_date
			f.input :governorate
		end
		f.actions
	end
	end
