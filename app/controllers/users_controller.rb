class UsersController < ApplicationController

  def me
    get_me = RestClient.get("https://api.procore.com/vapid/me",
      {"Authorization" => "Bearer #{session[:access_token]}"})

    @me = JSON.parse(get_me)
    puts @me['id']

  end

  def home
    created_at = session[:oauth_response]['created_at']
      @pretty_created_at = Time.at(created_at).to_datetime

    expires_in = session[:oauth_response]['expires_in']
      expires_at = expires_in + created_at
      @pretty_expires_at = Time.at(expires_at).to_datetime
  end

end
