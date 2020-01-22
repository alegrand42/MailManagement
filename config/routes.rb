Rails.application.routes.draw do
  root 'templates#index'

  resources :templates do
    collection { post :generate }
  end

  namespace :api do
    namespace :v1 do
      resources :mails, only: [:index, :create, :destroy, :show]
    end
  end

  get "api/v1/mails/:id/send_msg" => "api/v1/mails#send_msg"
end
