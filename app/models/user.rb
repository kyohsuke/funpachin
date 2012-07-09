class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :screen_name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.screen_name = auth["info"]["nickname"]
    end
  end
end
