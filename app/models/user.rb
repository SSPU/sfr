require 'digest/sha1'

class User < ActiveRecord::Base

  has_one :token, dependent: :destroy

  before_create :encrypt_password
  after_create  :create_token

  validates :email, uniqueness: true
  validates :email, presence: true

  validates :password, presence: true

  def encrypt_password
    self.email.strip!
    self.password = Digest::SHA1.hexdigest(self.password.strip.concat('noboru'))
  end

  def valid_password?(pwd)
    self.password == Digest::SHA1.hexdigest(pwd.concat('noboru')) ? true : false
  end

  def self.authenticate!(email, pwd)
    u = User.find_by email: email
    if u && u.valid_password?(pwd)
      u.create_token
    end
    return u
  end

  def create_token
    t = Token.new
    t.user = self
    t.generate
    t.save
  end

end
