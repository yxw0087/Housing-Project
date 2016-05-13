class Request < ActiveRecord::Base
  attr_accessor :activation_token
  before_save {self.clid = clid.downcase}
  before_create :create_activation_digest
  VALID_CLID_REGEX = /\A[a-z]{3}+\d{4}/
  validates :clid, length: {maximum: 7, minimum: 7}, presence: true, uniqueness: {case_sensitive: false}, 
  format: {with: VALID_CLID_REGEX}
  validates :gender, presence: true
  #, format: {with: /\A[mfMF]\z/}
  validates :room, length: {maximum: 4}
  validates :building, presence: true
  
  def activate_request
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  def send_notification_email
    UserNotifier.account_activation(self).deliver_now!
  end
  
  def send_accept_email
    UserNotifier.request_approved(self).deliver_now!
  end
  
  def send_deny_email
    UserNotifier.request_denied(self).deliver_now!
  end
  
  def remove_request(parameter)
    Request.find(parameter).destroy
  end
  
    def Request.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    def create_activation_digest
      self.activation_token = Request.new_token
      self.activation_digest = Request.digest(activation_token)
    end
    
    # Returns a random token.
    def Request.new_token
      SecureRandom.urlsafe_base64
    end
    
    def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
    end
end
