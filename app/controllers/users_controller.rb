class UsersController < ApplicationController

  def me
    # Send a request to the Show User Info endpoint
    # Reference documentation: https://developers.procore.com/reference/me
    get_me = RestClient.get(ENV['BASE_URL'] +'/vapid/me',
            { Authorization: "Bearer #{session[:oauth_response]['access_token']}" })

    # Store the parsed response in an instance variable
    @me = JSON.parse(get_me)

    rescue RestClient::ExceptionWithResponse
      if session[:oauth_response]
        redirect_to users_home_path, danger: "Something Went Wrong. Please Check/Refresh your Access Token and Try Again"
      else
        redirect_to login_index_path, danger: "Something Went Wrong. Please try again"
      end
  end

  def home
    # Fetch the access token from the previously-set session variable and store
    # the value in an instance variable
    @access_token = session[:oauth_response]['access_token']

    # Fetch the 'created_at' value from the session variable, prettify it, and
    # store the value in an instance variable
    created_at = session[:oauth_response]['created_at']
    @pretty_created_at = Time.at(created_at).asctime

    # Fetch the 'expires_in' value from the session variable, add it to the
    # 'created_at' value to find the time at which the access token will expire,
    # and store the new 'expires_at' value in an instance variable
    expires_in = session[:oauth_response]['expires_in']
    expires_at = expires_in + created_at
    @pretty_expires_at = Time.at(expires_at).asctime

    # Fetch the access token from the session variable and store the value in
    # an instance variable
    @refresh_token = session[:oauth_response]['refresh_token']

    rescue RestClient::ExceptionWithResponse
      if session[:oauth_response]
        redirect_to users_home_path, danger: "Something Went Wrong. Please Refresh your Access Token and Try Again"
      else
        redirect_to login_index_path, danger: "Something Went Wrong. Please try again"
    end
end
end
