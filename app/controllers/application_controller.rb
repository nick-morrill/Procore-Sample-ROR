class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  REDIRECT_URL = ENV['REDIRECT_URL']
end
