Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get 'about' => "homes#about"
  resources :posts
  resources :users
end
