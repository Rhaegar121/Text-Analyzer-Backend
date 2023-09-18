Rails.application.routes.draw do
  namespace :api do
    post 'text_analysis/analyze', to: 'text_analysis#analyze'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
