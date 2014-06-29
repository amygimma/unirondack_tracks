UnirondackTracks::Application.routes.draw do
  root "static_pages#index"
  devise_for :users
  get "campers/show"
  get "campers/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :items, only: [:index], format: false

  resources :camp_sessions, only: [:index] do
    resources :campers, only: [:index]
  end

  resources :campers, only: [:index, :show]
  resources :categories, only: [:index, :show, :destroy]


  resources :carts, only: [:show, :new, :create, :destroy] do
    resources :cart_items, only: [:show, :new, :create, :update]
    member { post :checkout }
    member { post :total_cart }

  end

  resources :cart_items, only: [:show, :new, :create, :update]


  resources :cart_items, only: [:show, :new, :update]



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
