class AddFreeGuestAndPaidGuestsToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :freeGuest, :boolean
  	add_column :appointments, :paidGuests, :integer
  end
end
