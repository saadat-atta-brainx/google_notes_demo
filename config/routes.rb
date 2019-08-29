Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'notes#index'
  devise_for :users
  resources :notes do
    get :shared_with_me, on: :collection
    member do
      delete :delete_image_attachment
      post :pinned
    end
    resources :shares do
      delete :delete_shared_note, on: :collection
    end
  end

  get 'shares/get_users'


end
