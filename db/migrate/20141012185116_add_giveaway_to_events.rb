class AddGiveawayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :giveaway, :boolean
  end
end
