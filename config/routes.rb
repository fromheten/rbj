Rails.application.routes.draw do
  resources :jobs, except: [:edit, :update, :destroy]

  # You can have the root of your site routed with "root"
  root 'jobs#index'

end
