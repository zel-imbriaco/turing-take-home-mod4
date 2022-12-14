Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :show]
      resources :subscriptions, only: [:create, :destroy]
    end
  end
end
