Rails.application.routes.draw do
  resources :exercises, except: :show
end
