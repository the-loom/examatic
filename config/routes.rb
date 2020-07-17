Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :dashboard, only: :index

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
