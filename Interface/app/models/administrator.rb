class Administrator < ActiveRecord::Base
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
end
