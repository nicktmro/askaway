class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise	 :database_authenticatable, :registerable,
    	     :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :email, :password, :password_confirmation, :remember_me
	has_many	:identities
	has_many	:topics
	
	has_many	:questions_to_answer,	:class_name => "Topic", 
										:foreign_key => "topic_id",
										:through => :identities,
										:source => :topics
end
