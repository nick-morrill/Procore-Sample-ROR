Rails.application.routes.draw do

  get 'login/index'

  get 'user/me'

  get 'login/callback'

  root 'login#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
