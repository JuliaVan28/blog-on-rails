Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
# get '/search', to:"articles#search"
get '/search' => 'articles#search', :as => 'search_article'
  resources :articles
  resources :tags, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
