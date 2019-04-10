class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  REDIRECT_URI = ENV['REDIRECT_URI']
  OAUTH_URL = ENV['OAUTH_URL']
  BASE_URL = ENV['BASE_URL']
end
