class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  	def verifyAdmin
  		unless currentUser.admin?
  			flash[:error] = "You must be an admin to access that."
  			redirect_to root_path
  		end
  	end
end
