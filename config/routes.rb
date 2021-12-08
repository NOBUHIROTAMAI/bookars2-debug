Rails.application.routes.draw do
  get '/search', to: 'searchs#search'
  get 'relationships/followings'
  get 'relationships/followers'

  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'

  resources :books, only: [:show,:index,:edit,:update,:create,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
 end

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end