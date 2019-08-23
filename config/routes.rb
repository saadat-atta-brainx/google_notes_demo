Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'notes#index'
  devise_for :users
  resources :notes do
    member do
      delete :delete_image_attachment
    end
  end
  post "notes/pinned", to: 'notes#pinned'
end
