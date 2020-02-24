Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get 'auth/google_oauth2', as: 'user_login'
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/dashboard', to: 'users#show'
  get 'logout', to: 'sessions#destroy'
end
