Rails.application.routes.draw do



  get 'explore' => "explore#index", :as => "explore"

  root 'explore#index'

  # count
  get 'links/untouched' => 'links#get_untouched_links'
  get 'channels/untouched' => 'channels#get_untouched_channels'

  post 'links/progress/update' => 'api#post_update_progress'
  post 'api/link' => 'api#create'

  post 'api/channels/update' => "api#channel_update"
  post 'api/channels/create' => "api#channel_create"

  post "api/link/elasticid" => "api#post_elastic_id"

  post 'api/videos/create' => "api#create_video"
  post 'api/elastic/create' => "api#elastic_create"

  get 'explore/search' => 'explore#search'
  get 'explore/stats' => 'explore#stats'

  resources :videos
  resources :links
  resources :channels

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
