Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get '/article/hashtag/:name', to: "articles#hashtag"
  get '/search_results', to: "search_results#index"
  get '/new_articles', to: "search_results#new_articles"
  get '/favorite_articles', to: "search_results#favorite_articles"
  get '/many_pvs_articles', to: "search_results#many_pvs_articles"
  get '/following_articles', to: "search_results#following_articles"

  devise_for :users
  resources :users, :only => [:show]
  resources :articles do
    member do
      get "favorite_users" => "favorites#favorite_users"
    end
    resources :comments
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:index, :create, :destroy]
  resources :relationships, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
