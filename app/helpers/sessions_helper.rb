module SessionsHelper
	def currentUser
		if session[:user_id].blank?
			return false
		end
		User.find(session[:user_id])
	end

	def currentUser?(user)
		currentUser == user
	end

	def signedIn?
		if currentUser.blank?
			return false
		else
			return true
		end
	end

	def verifyAdmin
		unless currentUser && currentlyAdmin
			flash[:notice] = "You must be an admin to access that."
			redirect_to root_path
		end
	end

	def currentlyAdmin?
		currentUser.admin? if currentUser
	end
end
