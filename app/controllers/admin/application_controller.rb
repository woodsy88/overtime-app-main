# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin

  def self.admin_types
    #if you need new admin types, add them into the below array
    ['AdminUser']
  end

  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      #unless the current user is type admin user, then do the block. 
       unless Admin.admin_types.include?(current_user.try(:type))
        flash[:alert] = "You are not authorized to access this page."
        redirect_to(root_path)
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end