class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_time_zone, if: :user_signed_in?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private
    def user_not_authorized
      flash[:error] = 'Você não tem permissão para fazer esta ação'
      redirect_to(request.referrer || root_path)
    end

  def set_time_zone
      #Time.zone = current_user.time_zone
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  
end
