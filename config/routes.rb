Rails.application.routes.draw do
  root 'speed_metrics#index'

  resources :speed_metrics, only: [:index, :create]
end
