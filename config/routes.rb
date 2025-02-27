Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks
  end
  root to: 'lists#index' # sets the homepage to show all lists
end
