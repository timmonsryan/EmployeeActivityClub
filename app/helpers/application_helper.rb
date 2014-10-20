module ApplicationHelper
	def human_boolean(boolean)
    	boolean ? 'Yes' : 'No'
	end

	def nextEvent
		Event.upcoming.first;
	end
end
