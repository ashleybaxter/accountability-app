AccountabilityApp::Application.routes.draw do
  resources :goals do
    collection do
      put :complete
    end
  end
end
