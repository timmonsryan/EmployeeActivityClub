FactoryGirl.define do
	factory :user do
		tellerNumber		  "244"
		firstName			  "Ryan"
		lastName			  "Timmons"
		department			  "Float Team"
		password			  "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin		true
		end
	end
end