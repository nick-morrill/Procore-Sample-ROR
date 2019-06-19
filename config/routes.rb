Rails.application.routes.draw do

  get 'login/index'

  get 'users/me'

  get 'users/home'

  post 'login/refresh'

  get 'login/callback'

  post 'login/revoke'

  root 'login#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
