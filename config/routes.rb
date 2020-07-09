Rails.application.routes.draw do
  
  devise_for :mentors
  
  resources :mentors
  resources :rooms

  root 'mentors#index'
end
