Rails.application.routes.draw do
  root to: "welcome#index"

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/auth/failure", to: "sessions#failure", via: :get

  post "/admin_login" => "sessions#admin", as: :admin_login
  get "/logout" => "sessions#destroy", as: :logout

  resources :dashboard, only: :index
  resources :welcome, only: :index

  resources :exams do
    get :solution, on: :member
    post :discard, on: :collection
  end

  resources :exercises do
    post :duplicate, on: :member
    post :pick, on: :member
    post :unpick, on: :member
    get :archive, on: :collection
    post :undestroy, on: :member
    post :toggle_flagged, on: :member
  end

  resources :users, only: [:index] do
    post :toggle_enabled, on: :member
  end

  resources :subjects, only: [:index] do
    member do
      # post :enroll
      post :switch
    end
  end
end
