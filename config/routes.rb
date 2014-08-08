Rails.application.routes.draw do

  get 'page/home'

  get 'page/galeria'

  get 'page/audio'

  #get 'page/videos'

  get 'page/guiriguiri'

  get 'v/:slug' => 'page#video'
  get 'a/:slug' => 'page#audio'
  get 'g/:slug' => 'page#gale'

  get 'categoria/:tipo(/:category)' => 'page#section'   , as: 'seccion'

  get 'masvistos' => 'page#home' , as: 'masvistos'  , :defaults => { :tipo => 1 }
  get 'mascomentados' => 'page#home' , as: 'mascomentados'  , :defaults => { :tipo => 2 }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'page#home'

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
