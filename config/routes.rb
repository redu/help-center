HelpCenter::Application.routes.draw do

  match 'help_central/' => 'help_central#index', :as => :help_central_index
  match 'help_central/faq' => 'help_central#faq', :as => :help_central_faq
  match 'help_central/faq/category' => 'help_central#faq_category', :as => :help_central_faq_category
  match 'help_central/guide/basic' => 'help_central#guide_basic', :as => :help_central_guide_basic
  match 'help_central/guide/student' => 'help_central#guide_student', :as => :help_central_guide_student
  match 'help_central/guide/teacher' => 'help_central#guide_teacher', :as => :help_central_guide_teacher
  match 'help_central/guide/manager' => 'help_central#guide_manager', :as => :help_central_guide_manager
  match 'help_central/guide/developer' => 'help_central#guide_developer', :as => :help_central_guide_developer
  match 'help_central/article' => 'help_central#article', :as => :help_central_article
  match 'help_central/search' => 'help_central#search', :as => :help_central_search
  match 'help_central/search/empty' => 'help_central#search_empty', :as => :help_central_search_empty


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
  root :to => "topics#index"

  resources :topics, :only => [:index, :show]
  resources :faqs, :only => [:show]
  resources :guides, :only => [:show]

  scope "/admin" do
    resources :topics, :except => [:index, :show]
    resources :faqs, :only => [:new, :create, :update]
    resources :guides, :only => [:new, :create, :update]
  end
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
