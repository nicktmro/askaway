class Topic < ActiveRecord::Base
	belongs_to	:owner,	:class_name => "User", 
						:foreign_key => "user_id"
	belongs_to	:addressee,	:class_name => "Identity",
							:foreign_key => "identity_id"
	has_many	:replies
	
	validates	:owner, :presence => true
	
	attr_accessor :addressee_identity_value
	validate	:valid_identity_type 
	
	# Callback to match the addressee identity. If one is not found then a new user with that addressee identity value will be created. 
	before_create :lookup_addressee
	
	#
	#	Business logic
	#
	
	def valid_identity_type
		#add our own custom error message
		errors.add(:addressee_identity_value, "must be a phone number, email address or twitter handle") if IdentityUtils.identity_type_for(addressee_identity_value).blank?		
	end
	
	def lookup_addressee
		identity = Identity.where(:identity_value => addressee_identity_value).first
		
		if identity.present?
		  self.addressee = identity
		else
			#Friday, fun fun fun!
			# Since there is no matching identity then we go off and create a new User that will own the new identity we must also create			
			
			# validation has already been done via the custom validator
			identity_type = IdentityUtils.identity_type_for(addressee_identity_value)			
			
			user = User.create
			self.addressee = user.identities.create(:identity_type => identity_type, :identity_value => addressee_identity_value) 
		end	  
	end
end
