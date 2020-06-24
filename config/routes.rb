Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'users#home'
  get '/home/about' => 'users#about', as: "about"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :chats, only: [:create]
  resources :rooms, only: [:create,:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
