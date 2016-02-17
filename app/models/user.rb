class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	has_secure_password
  has_many :posts
  has_many :comments

  validates_format_of :email, with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :username, uniqueness: true
  validates :password_digest, length: { minimum: 8 }
  validates :name, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    
    user = User.find_by_email(email)

    if user.authenticate(password)
      return user
    else
      return nil
    end

  end
end
