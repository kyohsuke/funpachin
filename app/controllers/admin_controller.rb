class AdminController < ApplicationController
  before_filter :check_admin
  before_filter :assign_details
  layout 'admin'

  def index
    @news = NewsFeed.last
  end
end
