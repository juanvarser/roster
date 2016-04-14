Rails.application.routes.draw do
  get '/' => 'site#index'

  devise_for :users do
    get 'users/:id', to: 'users#show'
  end

  resources :users do
    resources :bands, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      # patch 'update_band_info', :to => 'bands#update_band_info'
      resources :members, only: [:new, :create, :destroy]
      resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
        get 'route_map', to: 'events#get_route_map'
        resources :finances, only: [:index, :new, :create, :edit, :update, :destroy]
        get 'close_event', to: 'events#close_event'
        get 'event_info', to: 'events#get_event_info'
      end

      resources :reports, only: [:new, :create, :show]
      get 'events_report', to: 'reports#events_report'
      get 'events_stats', to: 'reports#events_stats'
    end
    resources :venues, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      post 'update_venue_info', to: 'venues#update_venue_info'
    end

    get 'all_bands_events', to: 'users#all_bands_events'
  end

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
