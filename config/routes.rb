Rails.application.routes.draw do
  resources :teams
  devise_for :users
  resources :teams do
    resource :chatroom_users
    resources :messages
  end
  root "teams#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
