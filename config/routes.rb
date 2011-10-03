XFactorPredictor::Application.routes.draw do
  resources :metrics

  get "contest/index"

  get "contest/new"

  get "contest/show"

  get "contest/create"

  get "contest/edit"

  get "contest/update"

  get "contest/destroy"

  resources :keywords

  resources :scores

  resources :contestants do
    resources :search_terms
  end
  
  match "get_scores/:id" => "scores#generate_scores"

  get "home/index"
  
  resources :contests
  
  match "schedule_job" => "application#schedule_job_for_12_hours"
  
  match "debug" => "application#debug"
  
  match "get_leaders" => "webservice#get_leaders"
  
  match "get_leaders_legally" => "webservice#get_leaders_legally"
  
  match 'get_leaders_test' => "webservice#get_leaders_test"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
