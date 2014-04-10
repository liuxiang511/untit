class User < ActiveRecord::Base
  has_one :concat
  def self.create_email_token
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    str=""
    (1..16).each do
      str += chars[rand(chars.size-1)]
    end
    str
  end
end