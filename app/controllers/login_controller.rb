require 'json'
require 'rest-client'
require 'date'

class LoginController < ApplicationController

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
          session[:oauth_response] = JSON.parse(response)
          puts session[:oauth_response]['access_token']


          redirect_to users_home_path
  end


  def refresh


  end





end
