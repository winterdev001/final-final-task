class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
        # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password,:location,:skills,:hourly_rate,:status,:description,:image])

        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password,:location,:location,:description,:image])

    end

    def after_sign_in_path_for(companies)
        companies_path
    end

    def after_sign_in_path_for(workers)
        workers_path
    end
end
