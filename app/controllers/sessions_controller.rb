class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]

    redirect_to root_url and return unless auth["provider"].downcase == 'twitter'
    redirect_to root_url and return unless is_allow? auth['extra']['raw_info']['screen_name']

    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    user ||= User.create_with_omniauth(auth)

    session[:user_id] = user.id

    user.save

    redirect_to '/admin'
  end

  def failure
    destroy
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

private
  def is_allow?(screen_name)
    return AccountManager.allow_users? screen_name
  end
end
