Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rhetorics#index'

  resources :rhetorics do
    member do
      get :image
    end
    resources :comments
  end

  resources :users, only: [:show]
  post "picks/:rhetoric_id/create" => "picks#create"
  post "picks/:rhetoric_id/destroy" => "picks#destroy"
end

