Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    
  resources :billboards do #PARENT 
  resources :artists #CHILD 
  end 
  resources :artists, except: [:index, :show, :update, :create, :destroy] do #PARENT
  resources :song #CHILD

   end 
  end 

end
