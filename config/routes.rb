Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :dashboard, only: :index

  resources :exercises do
    post :pick, on: :member
    post :unpick, on: :member
  end

  resources :exams do
    get :solution, on: :member
  end
end
