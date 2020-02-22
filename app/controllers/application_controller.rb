class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :configure_devise_permitted_parameters, if: :devise_controller?

	protected
	def configure_devise_permitted_parameters
		registration_params = [:gender, :email, :password, :password_confirmation]

		# if params[:action] == 'update'
		#   devise_parameter_sanitizer.for(:account_update) { 
		#     |u| u.permit(registration_params << :current_password)
		#   }
		# elsif params[:action] == 'create'
		#   devise_parameter_sanitizer.for(:sign_up) { 
	 #        |u| u.permit(registration_params) 
	 #      }
		# end
		devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
    	devise_parameter_sanitizer.permit(:account_update, keys: registration_params)
	end

end
