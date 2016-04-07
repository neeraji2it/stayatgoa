Rails.application.routes.draw do
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'
 resources :things
  resources :contacts 

get "/contact_us", :to => "home#contact_us"


 resources :home do
collection do
get :contact
post :contact_us
end
end

end
