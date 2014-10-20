module UsersHelper
	def eventSuggestion(event)
		if @user.events.include?(event) && !event.giveaway?
			"You are currently signed up.  See you on #{nextEvent.date.to_formatted_s(:long_ordinal)}!"
		elsif !event.giveaway? && !event.locked?
			"Sign up now!"
		end
	end
end
