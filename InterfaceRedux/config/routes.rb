Rails.application.routes.draw do
  get 'sessions/new'

  get 'static_pages/help'

  resources :administrators
  resources :account_activations, only: [:edit]
  resources :requests
  resources :students

  root 'requests#new'
  get 'tohelp' => 'static_pages#help'
  get 'submit' => 'requests#new'
  get 'adminlogin' => 'sessions#new'
  post 'adminlogin' => 'sessions#create'
  delete 'adminlogout' => 'sessions#destroy'
  get 'requestqueue' => 'requests#index'
  get 'createadmin' => 'administrators#new'
  get 'requests/:id' => 'requests#show', as: :decision
  get 'deciderequest' => 'requests#decide_request'
  get 'thisisretardedlylong/howdidyougethere' => 'administrators#new'
  
  #post 'requestaccept/:request' => 'request_approvals#destroy', as: :requestaccept
  #delete 'requestaccept/ :request' => 'request#destroy'
  #post 'requestdeny/ :id/' => 'request_denials#destroy', as: :requestdeny
  #delete 'requestdeny/ :id/' => 'request#destroy'
  
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
