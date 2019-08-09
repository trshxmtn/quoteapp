Rails.application.routes.draw do
  get 'tags/index'
  devise_for :users, controllers: { :registrations => 'users/registrations',
                                    :sessions => 'users/sessions' ,
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get 'profile/:id/' => 'users/registrations#profile', as: 'profile'
    get 'profile/:id/following', to: 'users/registrations#following', as: 'following'
    get 'profile/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end

  resources :relationships, only: [:create, :destroy]

  root 'rhetorics#index'

  resources :rhetorics do
    member do
      get :image
    end
    resources :comments
  end

  get 'comments/create'
  get 'comments/destroy'

  resources :picks, only: [:create, :destroy]
  resources :tags, only: [:index]

  get  'inquiry' =>'inquiries#index'
  get 'inquiry/confirm' => redirect("/inquiry")
  get 'inquiry/done' => redirect("/inquiry")
  post 'inquiry/confirm' => 'inquiries#confirm'
  post 'inquiry/done' => 'inquiries#done'

  get 'about' => 'pages#about'
  get 'privacy-policy' => 'pages#privacy'
  get 'terms' => 'pages#terms'

  get 'genre' => 'rhetorics#genre_search'
end

