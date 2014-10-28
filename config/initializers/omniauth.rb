Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, 'zJtxW5Q2jAs7RuDNC1TLDWkI3', 'MB7JXGfTEcYiXl2TEWyMUMTJrzek5InQkHfTy59I7KIC9v7gjz'
end