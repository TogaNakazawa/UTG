Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "utg#top"
   get "/" => "utg#top"
   get "/about" => "utg#about"
   get "/index" => "utg#index"
   post "/users/:id" =>"users#show"
resources :posts do
end

resources :users do
end

end
