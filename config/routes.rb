Rails.application.routes.draw do

  match '/search' => 'search#search', via: [:get, :post]
  get '/search/autocomplete' => 'search#autocomplete'

  # States
  get '/states'            => 'states#index', as: 'states'
  get '/:id'               => 'states#show', as: 'state'

  # Counties
  get '/:state/counties'     => 'counties#index', as: 'state_counties'
  get '/:state/:id'          => 'counties#show', constraints: { :id => /.+-(county|borough|census-area|parish)/ }, as: 'county'

  # Cities
  get '/:state/cities'         => 'cities#index', as: 'state_cities'
  get '/:state/:id'            => 'cities#show', as: 'city'
  get '/:state/:county/cities' => 'cities#index', constraints: { :county => /.+-(county|borough|census-area|parish)/ }, as: 'county_cities'

  root 'homepage#index'

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
