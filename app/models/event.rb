class Event < ActiveRecord::Base
	has_many :appointments
	has_many :users, through: :appointments

	validates :name, presence: true
	validates :description, presence: true

	scope :upcoming, lambda { where('DATE(date) > ?', Date.today).order(date: :asc) } 
end
