Rails.application.routes.draw do
  root to: 'lists#index' # sets the homepage to show all lists
  resources :movies, only: [:index, :show]

  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
