class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	#makes sure all users need to be signed insun
  before_action :authenticate_user!
end