Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :users
=======
>>>>>>> 9b608876d177b16f423de24a7d7542e0917bc2cb
  resources :loutres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
