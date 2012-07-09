class ToppageController < ApplicationController
  before_filter :assign_details

  def index
    @news = NewsFeed.last
  end
end
