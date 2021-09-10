Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :urls, only: [:create, :index]

  root to: 'urls#new'
  get '/:token', to: 'urls#show'
  get '/:token/info', to: 'urls#info'
end
