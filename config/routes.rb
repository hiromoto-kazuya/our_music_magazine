Rails.application.routes.draw do
  get '/', to: 'articles#index'
  resources :articles do
    collection do
      post :confirm
    end
  end
end
