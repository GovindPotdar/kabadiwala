Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"

  namespace :users do
    # Custom routes for registrations controller
    get "/sign_up",to:"registrations#new"
    post "/sign_up",to:"registrations#create"
     
    # Custom routes for sessions controller
    get "/sign_in",to:"sessions#new"
    post "/sign_in",to:"sessions#create"
    delete "/sign_out",to:"sessions#destroy"
     
    resources :passwords, only:[:new,:create,:edit,:update]
    
    resources :profile, only: [:index,:update] do
      patch "change_avatar",to:"profile#change_avatar", on: :collection
      get "edit",to:"profile#edit", on: :collection

    end

    resources :pickup_addresses
    
    resources :pickup_requests,only:[:index,:show]
    patch "/cancel_sell_scrap_request/:id",to:"pickup_requests#cancel_sell_scrap_request",as:"cancel_sell_scrap_request"

  end

  resources :sell_scraps, only: [:index,:new,:create]
  get "rate_list", to: "sell_scraps#rate_list"


  # admin related routes
  namespace :admin do
    resources :orders,only:[:index,:show] do 
      delete "/reject",to:"orders#reject"
      post "/done",to:"orders#done"
    end

  end

end
