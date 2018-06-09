Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "utg#top"
   get "/" => "utg#top"
   get "/about" => "utg#about"
   get "/index" => "utg#index"


  resources :users do
    resources :tags do
    end
   end



   resources :projects do
   end

   resources :groups do
     member do
       post 'accept'
       get 'interrupt'
       post 'interrupt'
       post 'from_block'
       post 'to_block'
       post 'from_unblock'
       post 'to_unblock'
       get 'confirm'
       post 'confirm'
     end
     resources :posts do
       member do
       end
     end
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
