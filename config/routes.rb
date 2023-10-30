Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :comments

  resources :posts do
    resources :comments
  end

  resources :subscriptions
  

  get 'welcome/index'
  get 'welcome/about'
  post 'contacts', controller: "welcome", action: :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
