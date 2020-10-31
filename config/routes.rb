Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :questions do
    resources :comments
  end
  get '/solve' => 'pages#solve'
  get '/dashboard' => 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
