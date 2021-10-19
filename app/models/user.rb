class User < ActiveRecord::Base


  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 3 }

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return true
    else
      return false
    end
  end
end
