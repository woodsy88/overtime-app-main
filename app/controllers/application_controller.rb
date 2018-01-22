class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
	#makes sure all users need to be signed insun
  before_action :authenticate_user!

  #Pundit Rescue from - what happens when a unauthorized user tries to do something
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
