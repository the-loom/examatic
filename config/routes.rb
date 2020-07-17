Rails.application.routes.draw do
  root to: 'welcome#index'

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/auth/failure", to: "sessions#failure", via: :get

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
  end
end
