class UserController < ApplicationController

  def me
    get_me = RestClient.get("https://api.procore.com/vapid/me",
      {"Authorization" => "Bearer #{session[:access_token]}"})

    @me = JSON.parse(get_me)
    puts @me['id']
  end

end
