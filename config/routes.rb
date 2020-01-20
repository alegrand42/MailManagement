Rails.application.routes.draw do
  root 'templates#index'

  resources :templates do
    collection { post :generate }
  end
end
