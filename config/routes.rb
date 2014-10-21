Rails.application.routes.draw do

  get 'tags/:tag', to: 'jobs#index', as: :tag

  resources :jobs, except: [:edit, :update, :destroy]

  # You can have the root of your site routed with "root"
  root 'jobs#index'

end
