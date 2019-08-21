Rails.application.routes.draw do
  root to: 'notes#index'
  devise_for :users
  resources :notes
end
