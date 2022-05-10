class User < ApplicationRecord
  has_secure_password
  # link.user.try(:email)


  validates_uniqueness_of :email
  
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }, presence: true
  validates :password, confirmation: { case_sensitive: true }
  
  def authenticate_with_credentials(email, password)
    if self.email.downcase == email.downcase
      if self.authenticate(password)
        return self
      end
    end
    return nil
  end
end
