require 'spec_helper'

describe Identity do
	it { should validate_presence_of :identity_type }
	it { should validate_presence_of :identity_value }

	it "rejects invalid identity_type" do
		identity = Identity.new(identity_type: "Bogus", identity_value: "Another value")
		identity.should be_invalid
		
		identity = Identity.new(identity_type: "Email", identity_value: "Another value")
		identity.should be_valid
		
		identity = Identity.new(identity_type: "Phone", identity_value: "Another value")
		identity.should be_valid
	end
end
