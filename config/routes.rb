Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  end
  root "utg#top"
   get "/" => "utg#top"
   get "/about" => "utg#about"
   get "/index" => "utg#index"


resources :posts do
end



resources :friendships do
    member do
      post 'accept'
      get 'interrupt'
      post 'interrupt'
      post 'from_block'
      post 'to_block'
      post 'from_unblock'
      post 'to_unblock'
    end
  end
end
