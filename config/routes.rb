Rails.application.routes.draw do
  devise_for :users
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
  scope "api" do 
    scope "v1" do
      resources :posts, controller: "api/v1/posts" do
        resources :comments, controller: 'api/v1/posts/comments' do
          post 'append-child', action: :append_child
        end
        resources :likes, controller: "api/v1/posts/likes", only: [:create, :destroy]
      end
    end
  end
end
