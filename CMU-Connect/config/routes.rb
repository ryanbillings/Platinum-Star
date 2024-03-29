CMUConnect::Application.routes.draw do


  #ActiveAdmin.routes(self)

  #devise_for :admin_users, ActiveAdmin::Devise.config

  resources :surveys
  resources :messages
  resources :complaints
  resources :conferences
  resources :theme_chats
  match '/conference/video/:id' => 'conferences#video', :as => :join_conference
  match '/theme_chat/video/:id' => 'theme_chats#video'
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  match 'invitations/:id/confirm' => 'invitations#confirm', :as => :confirm
  match 'invitations/:id/invite' => 'invitations#invite'
  match 'invitations/create' => 'invitations#create'
  match 'invitations/autocomplete' => 'invitations#autocomplete'  
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout
  match 'password_reset' => 'home#password_reset', :as => :password_reset
  match 'login' => 'sessions#new', :as => :login
  match 'reset' => 'home#reset'
  match 'welcome' => 'home#welcome', :as => :welcome
  match 'reset_all' => 'home#reset_all', :as => :reset_all  
  match 'landing' => 'home#landing', :as => :landing
  
  match 'professional' => 'messages#professional', :as => :professional
  
  match 'privacy' => 'home#privacy', :as => :privacy
  
  match 'contact' => 'home#contact', :as => :contact
  
  match 'destroy' => 'users#destroy', :as => :delete_account
  match 'admin' => 'home#admin', :as => :admin

  match 'roulette/:type' => 'rando_chats#create'
  match 'rando_chats/:id' => 'rando_chats#show' 
  match 'rando_chats/exchange/:id/:match/:next/:type' => 'rando_chats#exchange', :as => :exchange
  match 'rando_chats/exit_window/:id' => 'rando_chats#exit_window'
  #match 'complaint' => 'complaints#index', :as => :complaint
  
  match 'faq' => 'home#faq', :as => :faq
  
  match 'calendar' => 'calendar#index', :as => :calendar
  match 'topics/vote/:survey/:topic' => 'topics#vote'
  resources :rando_chats  
  resources :sessions
  resources :users
 
  root :to => 'home#landing'


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
