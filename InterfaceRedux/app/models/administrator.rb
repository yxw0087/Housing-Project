class Administrator < ActiveRecord::Base
  before_save {self.username = username.downcase}
  validates :username, presence: true, uniqueness: {case_sensitive:false}
  validates :password, presence: true, length: {minimum: 8}
  
  has_secure_password
  def Administrator.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def Administrator.new_token
    SecureRandom.urlsafe_base64
  end
end
