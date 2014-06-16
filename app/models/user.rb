class User < ActiveRecord::Base
  has_secure_password  
  validates :name, presence: true
  validates :email, presence: true, 
  					format: /\A\S+@\S+\z/,
  					uniqueness: { case_sensitive: false }
  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }

  def self.authenticate(email_or_username , password)
  		u = User.find_by(username: email_or_username) || User.find_by(email: email_or_username)
  		u && u.authenticate(password) 
  end

end
