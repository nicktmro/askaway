class Identity < ActiveRecord::Base
	belongs_to	:user
	has_many	:topics
	
	validates_presence_of :identity_value

	validates	:identity_value, :length => 5..255 	
	validate	:valid_identity_value 
	
	# Callback to match the addressee identity. If one is not found then a new user with that addressee identity value will be created. 
	before_create :lookup_identity_type
	
	def valid_identity_value
		#add our own custom error message
		errors.add(:identity_value, "must be a phone number, email address or twitter handle") if IdentityUtils.identity_type_for(identity_value).blank?		
	end
	
	def lookup_identity_type
		# validation has already been done via the custom validator
		self.identity_type = IdentityUtils.identity_type_for(identity_value)			
	end
end
