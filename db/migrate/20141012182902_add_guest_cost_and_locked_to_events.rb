class AddGuestCostAndLockedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :guestCost, :float
    add_column :events, :locked, :boolean
  end
end
