Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'rhetorics/index'
  get 'rhetorics/new'
  get 'rhetorics/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rhetorics#index'
  resources :rhetorics do
    member do
      get :image
    end
  end
end
