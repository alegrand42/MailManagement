Rails.application.routes.draw do
  root 'templates#index'

  resources :templates do
    collection { post :generate }
  end

  namespace :api do
        namespace :v1 do
            resources :mails do
              collection { get :status}
            end
        end
    end
end
