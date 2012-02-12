class Reply < ActiveRecord::Base
	belongs_to	:topic
	
	belongs_to	:sender,		:class_name => "Identity",
								:foreign_key => "identity_id"
	belongs_to	:topic_owner,	:class_name => "User", 
								:foreign_key => "user_id"
								
	before_create :lookup_users
	
#	scope	:viewable_replies_for, lambda { |user| joins("left join identities on identities.id = topics.identity_id").where("topics.public is true or topics.user_id = :user_id or identities.user_id = :user_id", :user_id => user.try(:id)) } 
	
	def lookup_users
		self.topic_owner = self.topic.owner
		self.sender = self.topic.addressee
	end
end
