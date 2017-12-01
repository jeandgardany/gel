class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private
  def user_not_authorized
      flash[:notice] = "Você não tem permissão para fazer esta ação"
      redirect_to(request.referrer || users_path)
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end
  
end
