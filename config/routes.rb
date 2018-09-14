Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'articles#index'

  devise_for :users
  resources :users, :only => [:index,:show]

  resources :articles do
    resources :comments
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
