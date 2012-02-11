class User < ActiveRecord::Base
	has_many	:identities
	has_many	:topics
	
	has_many	:questions_to_answer,	:class_name => "Topic", 
										:foreign_key => "topic_id",
										:through => :identities,
										:source => :topics
end
