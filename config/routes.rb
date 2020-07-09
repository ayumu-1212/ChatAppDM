Rails.application.routes.draw do
  
  resources :mentors
  resources :rooms

  root 'users#index'
end
