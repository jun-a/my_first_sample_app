class User < ActiveRecord::Base

	attr_accessible :name, :email, :password, :password_confirmation, :remember_token 
	has_secure_password
	has_many :microposts, dependent: :destroy
	validates :name, :email, :password, :password_confirmation, presence: true

	
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	validates :password, confirmation: true
	validates :name, length: { maximum: 10 }



	private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
 	end

end
