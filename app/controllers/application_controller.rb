class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


 def current_user?(user)
     user == current_user
  end

  def after_sign_in_path_for(resource)
     if resource.role == 'admin'
      projects_path
     elsif resource.role == 'staff'
      project_path(@project)
     else
  	  root_path
     end
    end
  helper_method :admin?
    def landlord?
      current_user && current_user.role == "admin"
    end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :mobile, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :mobile, :email, :password, :current_password)}
          end
end
