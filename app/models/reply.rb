class Reply < ActiveRecord::Base
	belongs_to	:topic
	
	belongs_to	:sender,		:class_name => "Identity",
								:foreign_key => "identity_id"
	belongs_to	:topic_owner,	:class_name => "User", 
								:foreign_key => "user_id"
end
