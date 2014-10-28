AccountabilityApp::Application.routes.draw do
  
  root :to => "goals#index" 
  get 'auth/twitter/callback' => 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/')
  
  resources :goals do
    get 'tomorrow', :on => :collection
    get 'today', :on => :collection
    collection do
      put :complete
    end
  end
end
