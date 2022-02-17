Rails.application.routes.draw do
  root to: 'profiles#index'
  resources :profiles do
    post 'rescan', on: :member
  end
  get '/s/:slug', to: 'links#show', as: :short
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
