require 'json'
require 'rest-client'
require 'date'

class LoginController < ApplicationController
  include JSON

  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  REDIRECT_URL = ENV['REDIRECT_URL']

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
          @response_object = JSON.parse(response)


          @response_object['access_token'] = session[:access_token]
          @response_object['refresh_token'] = session[:refresh_token]
          @response_object['created_at'] = created_at
            @pretty_time = Time.at(created_at).to_datetime

          expires_at = @response_object['expires_at']

          redirect_to users_home_path
  end


  def refresh


  end





end
