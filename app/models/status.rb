class Status < ActiveRecord::Base
  attr_accessible :detail

  def self.hashall
    temp = {}
    Status.all.each {|i| temp[i[:id]] = i[:detail] }
    return temp
  end
end
