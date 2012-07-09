class Member < ActiveRecord::Base
  belongs_to :status
  attr_accessible :name, :other, :twitter, :status_id

  before_validation do
    self.name = self.name.strip
  end

  before_validation do
    self.twitter = self.twitter.strip
  end
end
