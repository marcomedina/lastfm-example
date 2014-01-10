RORPair2::Application.routes.draw do
  root to: 'artists#index'

  resources :artists, only: [:index, :show]
end
