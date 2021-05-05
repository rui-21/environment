Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    get 'follow_users' => 'users#follow_index', as: 'follow_users'
    get 'follower_users' => 'users#follower_index', as: 'follower_users'
  end

  post 'follow/:id' => 'relationships#follow' ,as: 'follow'
  delete 'unfollow/:id'=> 'relationships#unfollow' ,as: 'unfollow'

  resources :books, except: [:new] do
    resource :favorites,only: [:create, :destroy]
    resources :book_comments,only: [:create, :destroy]
  end

  get 'searchs/search' =>'searchs#search', as: 'search'

  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
end
