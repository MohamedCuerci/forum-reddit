Rails.application.routes.draw do

  resources :messages
  root "message#index"

end
