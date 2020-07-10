Rails.application.routes.draw do
  
  get 'students/index'
  get 'students/show'
  devise_for :mentors, controllers: {
    sessions: 'mentors/sessions',
    passwords: 'mentors/passwords',
    registrations: 'mentors/registrations'
  }
  
  devise_for :students, controllers: {
    sessions: 'students/sessions',
    passwords: 'students/passwords',
    registrations: 'students/registrations'
  }
  
  resources :mentors
  resources :rooms
  resources :direct_messages

  root 'mentors#index'
end
