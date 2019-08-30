Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'notes#index'
  devise_for :users
  resources :notes do
    get :shared, on: :collection
    member do
      delete :delete_image_attachment
      post :pinned
    end
    resources :shares do
      # delete :delete_shared, on: :collection
    end
  end

  resources :users do
    get :get_users, on: :collection
  end

end
