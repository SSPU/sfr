require 'digest/sha1'

class User < ActiveRecord::Base
  before_create :encrypt_password

  validates_uniqueness_of :email

  def encrypt_password
    self.password = Digest::SHA1.hexdigest(self.password.strip.concat('noboru'))
  end

  def valid_password?(pwd)
    self.password == Digest::SHA1.hexdigest(pwd.concat('noboru')) ? true : false
  end

  def self.authenticate!(email, pwd)
    u = User.find_by_email(email)
    u if u && u.valid_password?(pwd)
  end

end
