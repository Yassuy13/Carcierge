Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#index'
  resources :users
  resources :posts do
    resources :browses
  end
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :categories
end
