ByDays::Application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'hotels#index'

  resources :hotels do 
    resources :room_types, except: [:index, :show] do
      match '/check_availability',  to: 'room_types#check_availability', via: 'post', as: 'check_availability'
    end
  end

  match '/rooms/:room_id/bookings/new',   to: 'bookings#new',     via: 'get',  as: 'new_room_booking'
  match '/rooms/:room_id/bookings',       to: 'bookings#create',  via: 'post', as: 'room_bookings'
  match '/bookings',                      to: 'bookings#index',   via: 'get',  as: 'bookings'
  match '/bookings/:id',                  to: 'bookings#destroy', via: 'delete'
  match '/bookings/:id',                  to: 'bookings#show',    via: 'get',  as: 'booking'

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
