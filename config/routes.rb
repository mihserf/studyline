ActionController::Routing::Routes.draw do |map|

  map.admin_login 'admin', :controller => 'admin', :action => 'index'
  map.admin_login 'admin/login', :controller => 'admin', :action => 'login'
  map.admin_logout 'admin/logout', :controller => 'admin', :action => 'logout'

  map.resources :pages
  map.resources :send_message, :only => :create
  map.resources :programs, :shallow => true do |p|
      p.resources :courses
    end
  map.resources :countries
  map.resources :courses
  map.resources :events
  
  
  map.namespace :admin do |admin|
    admin.resources :pages
    admin.resources :programs
    admin.resources :countries
    admin.resources :courses
    admin.resources :events
  end
  
  map.with_options :path_prefix => ':lang', :lang => /ru|en|ua/, :name_prefix => 'l_' do |l|
    l.resources :pages
    l.resources :programs do |p|
      p.resources :courses
    end
    l.resources :courses
    l.resources :countries
    l.resources :events

    l.namespace :admin, :path_prefix => ':lang/admin', :name_prefix => 'admin_l_' do |admin|
      admin.resources :pages
      admin.resources :programs
      admin.resources :countries
      admin.resources :courses
      admin.resources :events
    end
  end

  map.with_options :controller => "pages" do |page|
    page.home "/", :action =>  "home"
    page.home ":lang/", :action =>  "home", :lang => /ru|en|ua/
    page.home "/:id", :action => "show"
    page.home "/:lang/:id", :action => "show"
  end
  
#  map.with_options :controller => "pages" do |page|
#    page.home "/", :action =>  "home"
#    ["about_us","contacts","faq","founder","team","mission","principles","london"].each do |action|  page.home "/#{action}", :action =>action   end
#    page.home ":lang/", :action =>  "home", :lang => /ru|en|ua/
#    page.home ":lang/:action"
#  end
  
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
