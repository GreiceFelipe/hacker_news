Rails.application.routes.draw do
  root to: "top_hacker#index"

  resources :top_hacker, only: [ :index ]
end
