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

          redirect_to users_home_path
  end


  def refresh

    request = {
          "grant_type" => "refresh_token",
          "client_id" => CLIENT_ID,
          "client_secret" => CLIENT_SECRET,
          "refresh_token" => session[:oauth_response]['refresh_token'],
          "redirect_uri" => REDIRECT_URL
        }

        response = RestClient.post('https://login.procore.com/oauth/token', request.to_json, {content_type: :json, accept: :json})
        session[:oauth_response] = JSON.parse(response)

        redirect_to users_home_path

  end
end
