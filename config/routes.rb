AccountabilityApp::Application.routes.draw do
  
  root :to => "goals#index" 
  
  resources :goals do
    get 'yesterday', :on => :collection
    collection do
      put :complete
    end
  end
end
