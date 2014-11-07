Rails.application.routes.draw do

  get 'admin' => 'admin#index' , as:'adminhome' 

  get 'export/brigtcove'

  get 'export/gnweb/:tipo' =>'export#gnweb' , as:'exportgnweb'
  get 'export/audio/:tipo' =>'export#audio' , as:'exportaudio'

  get 'export/oneBrighcove/:slug' => 'export#oneBrighcove' , as:'oneBrighcove'

  get 'export/manyBrighcove/:id' => 'export#manyBrighcove' , as:'manyBrighcove'

  get 'export/audio'

  get 'page/home'

  get 'page/galeria'

  get 'page/audio'

  get '/search' => 'page#search' , as:'search'
  #get 'page/videos'

  get 'guiriguirialaire' => 'page#guiriguiri'  , as:'guiri'

  get 'v/:slug' => 'page#video' , as:'video'
  get 'a/:slug' => 'page#audio' , as:'audio'
  get 'g/:slug' => 'page#gale' , as:'gale'


  get 'categoria/:tipo(/:category)' => 'page#section'   , as: 'seccion'
  get 'rss/:tipo' => 'rss#section' , as:'rss'
  

  get 'loadmore_categoria/:page/:tipo(/:category)' => 'page#load_section'   , as: 'loadmoresection'
  get 'loadmore/:lastid(/:tag)' => 'page#loadgrid' 

  get 'tag/:tag' => 'page#home' , as: 'tag'  , :defaults => { :tipo => 3 }
  
  get 'masvistos' => 'page#home' , as: 'masvistos'  , :defaults => { :tipo => 1 }
  get 'mascomentados' => 'page#home' , as: 'mascomentados'  , :defaults => { :tipo => 2 }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'page#home'

   get 'admin/loadtable'

   get 'admin/nuevo_archivo' => 'admin#newMedia' , as:'newMedia'

   post 'admin/save_archive' => 'admin#saveArchive' , as:'saveArchive'

   get 'admin/edit_media/:id_media' => 'admin#editMedia' , as:'editMedia'

   patch 'admin/update_archive/:id' => 'admin#updateArchive', as:'updateArchive'
    
   get 'admin/delete_media/:id' => 'admin#deleteMedia' , as:'deleteMedia' 
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
