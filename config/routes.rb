Rails.application.routes.draw do
  resources :exercises do
    post :pick, on: :member
    post :unpick, on: :member
  end

  resources :exams
end
