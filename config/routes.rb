Rails.application.routes.draw do
  root to: 'notes#index'
  devise_for :users
  resources :notes do
    member do
      delete :delete_image_attachment
    end
  end
  post "notes/pinned", to: 'notes#pinned'
end
