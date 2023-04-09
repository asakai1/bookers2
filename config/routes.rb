Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:new, :index, :show]
  resources :users, only: [:index, :show, :edit, :update]
  get 'books/new'
  post 'books' => 'users#create'

  get "/homes/about" => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
