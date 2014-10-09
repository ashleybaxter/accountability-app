AccountabilityApp::Application.routes.draw do
  
  root :to => "goals#index" 
  
  resources :goals do
    collection do
      put :complete
    end
  end
end
