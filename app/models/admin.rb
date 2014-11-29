require 'digest/sha1'

class Admin < ActiveRecord::Base

  before_create :encrypt_password

  validates :name, uniqueness: true
  validates :name, presence: true

  validates :password, presence: true

  def encrypt_password
    self.name.strip!
    self.password = Digest::SHA1.hexdigest(self.password.strip.concat('umaku'))
  end

  def valid_password(pwd)
    self.password == Digest::SHA1.hexdigest(pwd.concat('umaku')) ? true : false
  end

  def self.authenticate!(name, pwd)
    a = Admin.find_by name: name
    a.valid_password(pwd) if a
    return a
  end

end
