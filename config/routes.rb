Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/minion', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  root :to => "articles#index", via: [:post, :get]

  match '/auth/:provider', :to => 'sessions#create',  via: [:post, :get]
  match '/auth/failure', :to => 'sessions#failure',  via: [:post, :get]
  match "/signout" , :to => 'sessions#destroy', :as => :signout, via: [:post, :get]

  match "/privacy", :to => 'system#privacy_policy', :as => :privacy, via: [:get]
  match "/terms", :to => 'system#terms_of_service', :as => :terms, via: [:get] 

  #resources :users, only: [:show,:edit,:update], via: [:post,:get]
  resources :users, only: [:show,:update,:edit], via: [:post,:get] do
   resources :unpublishedarticles, only: [:new,:show,:update,:create,:edit], via: [:post,:get]
   #resources :comments, only: [:show,:update,:destroy,:create], via: [:post,:get]
  end

  resources :feedback_messages, only: [:create], via: [:post,:get]


  resources :articles,  only: [:index,:show,:create], via: [:post,:get] do
   resources :comments, only: [:index,:show,:update,:destroy,:create], via: [:post,:get] 
   resources :votes , only: [:update,:create], via: [:post,:get]
  end
  


  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
