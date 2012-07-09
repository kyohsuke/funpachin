class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  def check_admin
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    redirect_to root_path and return if @current_user.nil?
  end

  def assign_details
    @status = Status.hashall
    @list = {}

    @status.each do |k,v|
      @list[v] = Member.find_all_by_status_id(k, :order => "id ASC")
    end

    names = []

    @list.each do |k,v|
      v.each do |detail|
        names << detail[:name]
      end
    end

    twitters = []
    @list.each do |k,v|
      v.each do |detail|
        twitters << detail[:twitter]
      end
    end

    duplicates_of_name    = names.group_by{|i| i}.reject{|k,v| v.one?}.keys.delete_if {|i| i.to_s.length <= 0 }
    duplicates_of_twitter = twitters.group_by{|i| i}.reject{|k,v| v.one?}.keys.delete_if {|i| i.to_s.length <= 0 }

    @duplicates = {}

    @duplicates[:name] = []
    @duplicates[:twitter] = []

    @duplicates[:name] = Member.select(:name).where("name IN (?)", duplicates_of_name).uniq if duplicates_of_name.count > 0
    @duplicates[:twitter] = Member.select(:twitter).where("twitter IN (?)", duplicates_of_twitter).uniq if duplicates_of_twitter.count > 0
  end
end
