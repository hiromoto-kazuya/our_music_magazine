Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users
  resources :users, :only => [:show]
  resources :articles do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
