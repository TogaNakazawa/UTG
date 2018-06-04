Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "utg#top"
   get "/" => "utg#top"
   get "/about" => "utg#about"
   get "/index" => "utg#index"
   get "/posts/new" => "posts#new"
  post "/posts/new" => "posts#create"
  get "/posts/index" => "posts#index"

  resources :users do
   end

   resources :projects do
     
   end

end
