class Identity < ActiveRecord::Base
	belongs_to	:user
	
	validates_presence_of :identity_type 
	validates_presence_of :identity_value

	validates	:identity_type, :inclusion => { :in => ["Email", "Phone"] }
	
end
