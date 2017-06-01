Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  get '/gangpyung' => 'home#gangpyung'
  
  devise_scope :user do
    # using login path for registration
    get '/login' => 'devise/sessions#new'
    get '/sign-up' => 'devise/registrations#new'
  end
  
  #posts controller
  #create
  get '/posts/posts_index' =>'posts/posts_index'
  
  #le posts controller
  #create
  get '/leposts/leposts_index' => 'leposts#leposts_index'
  get '/leposts/lederand' => 'leposts#lederand'
  get '/leposts/lcs' => 'leposts#lcs'
  
  #Lecture CRUD URL
  get '/leposts/new/:lepost_id' => 'leposts#new' #게시글 생성화면 나오는 url
  get '/leposts/create/:lepost_name/:lepost_id' => 'leposts#create' #게시글 올릴때 나오는 url 
  get '/leposts/:lepost_id/show/:lpost_id' => 'leposts#show' #보는 곳 url
  get '/leposts/edit/:lpost_id' => 'leposts#edit'
  get '/leposts/:lepost_id/update/:lpost_id' => 'leposts#updateda' #업데이트 해주는 곳
  get '/leposts/:lepost_id/destroy/:lpost_id' => 'leposts#destroy'
  
  #lecture COMMENT URL
  get '/leposts/:lepost_id/show/:lpost_id/lcomment' => 'lcomments#lcomment'
  get 'lcomments/destroy/:lpost_id' => 'lcomments#destroy'
  
  
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
