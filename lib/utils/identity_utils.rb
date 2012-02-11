class IdentityUtils
	
	def self.identity_type_for(identity_value)
		if identity_value =~ /^\d{6,15}+$/ # is it a number between 6 and 15 characters ?
			return "Phone"		  
		elsif identity_value =~ /^@/ # does it begin with @ ?
			return "Twitter"
		elsif identity_value =~ /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
			return "Email"
		else
			return nil
		end
	end
end