class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(tellerNumber: params[:tellerNumber])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "You have logged in!"
			redirect_to root_path
		else
			flash.now[:error] = "Invalid Signin"
			render signin_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have signed out."
		redirect_to root_path
	end
end
