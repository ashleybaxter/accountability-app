AccountabilityApp::Application.routes.draw do
  
  root :to => "goals#index" 
  
  resources :goals do
    get 'tomorrow', :on => :collection
    get 'today', :on => :collection
    collection do
      put :complete
    end
  end
end
