Untit::Application.routes.draw do
  #devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'site#index'
  resources :site do
    collection do
      get  'logout'
    end
  end
  namespace :user do |user|
    resources :login do
      collection do
        post 'login'
      end
    end
    resources :registers do
       collection do
         get  'ajax_validate_username'
         get  'ajax_validate_email'
         get 'ajax_validate_firm_name'
         get  'create'
       end
    end
  end
  namespace :firm do
    resources :firms do
      get 'get_cities_options', on: :collection
      get 'get_district_options', on: :collection
      get 'get_category_options', on: :collection
      get 'desc', on: :collection
      get 'linker', on: :collection
      get 'detail', on: :collection
      get 'honor', on: :collection
      get 'reset_pass', on: :collection
      post 'info_submit',on: :collection
      post 'desc_submit',on: :collection
      post 'linker_submit',on: :collection
      post 'detail_submit',on: :collection
    end
    resources :products do
      get 'category', on: :collection
      get 'publish', on: :collection
      get 'manage', on: :collection
      post 'manage', on: :collection
      get 'category_add', on: :collection
      get 'category_delete', on: :collection
      get 'category_next', on: :collection
      post 'product_publish', on: :collection
      get 'pro_to_destroy',on: :collection
    end
    resources :shops do
      get 'link', on: :collection
      get 'album', on: :collection
      get 'picture', on: :collection
      get 'dynamic', on: :collection
    end
    resources :home do
      post 'message',on: :collection
    end
    resources :honesties
    resources :messages do
      get 'inbox', on: :collection
    end
    resources :purchases do
      get 'info_search', on: :collection
      get 'info_static', on: :collection
    end
    resources :honesties do
      post 'license_add', on: :collection
    end

  end
  #root :to=>'home#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchases' => 'catalog#purchases', as: :purchases

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
  #match "login", :to=>'user/login',:as=>'login'

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
  get ':controller(/:action(/:id))'
  get ':controller/:action/:id.:format'
  #match '/simple_captcha/:action', to: simple_captcha, via: :all
  #map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'
  match ":controller(/:action)", :controller => /simple_captcha\/[^\/]+/, via: :all
end
