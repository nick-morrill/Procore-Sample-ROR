require 'httparty'
require 'json'
require 'rest-client'

class LoginController < ApplicationController

  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  REDIRECT_URL = ENV['REDIRECT_URL']
  COMPANY_ID = ENV['COMPANY_ID']

  include HTTParty
  include JSON

  def callback
    @authorization_code = params["code"]

    request = {
          "grant_type" => "authorization_code",
          "client_id" => CLIENT_ID,
          "client_secret" => CLIENT_SECRET,
          "code" => @authorization_code,
          "redirect_uri" => REDIRECT_URL
        }

        response = RestClient.post('https://login.procore.com/oauth/token', request.to_json, {content_type: :json, accept: :json})
        @access_token = JSON.parse(response)

        session[:access_token]= @access_token['access_token']
          created_at = @access_token['created_at']
          exipries_in = @access_token['exipries_in']
          refresh_token = @access_token['refresh_token']

        puts refresh_token
        #flash[:notice] = "You've received an access token!"
  end

  def me
    get_me = RestClient.get("https://api.procore.com/vapid/me",
      {"Authorization" => "Bearer #{session[:access_token]}"})

    @me = JSON.parse(get_me)
  end


  #Refresh token
    #take Unix timestamp from callback method
    #if button is clicked before timestamp,
      #return message that says the access token is still valid
    #else call refresh method to obtain a new token

end
