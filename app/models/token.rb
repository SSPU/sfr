class Token < ActiveRecord::Base

  belongs_to :user

  def generate(opt = {expired_in: 7200})
    self.token = SecureRandom.uuid
    self.expire = Time.now + opt[:expired_in]

    existed_token = Token.find_by user_id: self.user_id
    existed_token.destroy if existed_token
  end

end
