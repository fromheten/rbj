Rails.application.routes.draw do

  get 'categories', to: 'tags#index'
  get 'categories/:tag', to: 'jobs#index', as: :tag

  resources :jobs, except: [:edit, :update, :destroy]

  # Remember that internally, there is not categories only tags
  root 'tags#index'
end
