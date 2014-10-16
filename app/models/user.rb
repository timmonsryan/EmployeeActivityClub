class User < ActiveRecord::Base
	has_secure_password
	validates :tellerNumber, length: { in: 3..4 },
							 uniqueness: true,
							 presence: true
	validates :firstName, length: { maximum: 40 },
						  presence: true
	validates :lastName, length: { maximum: 40 },
						 presence: true

	has_many :appointments
	has_many :events, through: :appointments
	has_many :posts
end
