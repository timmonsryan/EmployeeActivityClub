require 'rails_helper'

describe User do
	let(:user) { FactoryGirl.build(:user) }
	subject { user }

	describe "basic properties" do
		it { should respond_to(:password) }
		it { should respond_to(:password_confirmation) }
		it { should respond_to(:password_digest) }
		it { should respond_to(:tellerNumber) }
		it { should respond_to(:firstName) }
		it { should respond_to(:lastName) }
		it { should respond_to(:admin) }
	end

	describe "with correct attributes" do
		sampleUser = FactoryGirl.build(:user, tellerNumber: "245")
		expect(sampleUser).to be_valid
	end

	describe "with a tellerNumber" do
		describe "that is missing" do
			before { user.tellerNumber = nil }
			it { should_not be_valid }
		end

		describe "that is too long" do
			before { user.tellerNumber = "12345" }
			it { should_not be_valid }
		end

		describe "that is too short" do
			before { user.tellerNumber = "12" }
			it { should_not be_valid }
		end

		# describe "that is already taken" do
		# 	user1 = FactoryGirl.create(:user)
		# 	user2 = FactoryGirl.build(:user)
		# 	expect(user2).not_to be_valid
		# end
	end
end
