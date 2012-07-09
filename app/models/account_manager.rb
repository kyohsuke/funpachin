class AccountManager < ActiveRecord::Base
  attr_accessible :screen_name

  def self.allow_users?(name)
    !AccountManager.find_by_screen_name(name).try(:screen_name).nil?
  end
end
