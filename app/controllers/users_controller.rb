class UsersController < ApplicationController

  def me
    get_me = RestClient.get("https://api.procore.com/vapid/me",
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}"})

    @me = JSON.parse(get_me)
  end

  def home
    @access_token = session[:oauth_response]['access_token']

    created_at = session[:oauth_response]['created_at']
      @pretty_created_at = Time.at(created_at).asctime

    expires_in = session[:oauth_response]['expires_in']
      expires_at = expires_in + created_at
      @pretty_expires_at = Time.at(expires_at).asctime

    @refresh_token = session[:oauth_response]['refresh_token']
  end

end
