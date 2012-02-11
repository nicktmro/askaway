class Topic < ActiveRecord::Base
	belongs_to	:owner,	:class_name => "User", 
						:foreign_key => "user_id"
	belongs_to	:addressee,	:class_name => "Identity",
							:foreign_key => "identity_id"
	has_many	:replies
end
