module EventsHelper

	def alreadyRegistered?(event)
		signedIn? && currentUser.events.where(id: event.id).count > 0
	end

end
