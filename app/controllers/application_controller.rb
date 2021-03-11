class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


 def current_user?(user)
     user == current_user
  end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :mobile, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :mobile, :email, :password, :current_password)}
          end
end
