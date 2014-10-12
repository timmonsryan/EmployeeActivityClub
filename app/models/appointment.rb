class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true
  validates :event_id, presence: true, uniqueness: { scope: :user_id }

  def guestTotal
		guestTotal = 0
		guestTotal += self.paidGuests
		guestTotal += 1 if self.freeGuest?
		return guestTotal
	end
end
