Brightpoint::Application.routes.draw do
  
  devise_for :users

  namespace :api do
    namespace :v1  do
      resources :data_sets
      get "classifications/new" => "classifications#new"
    end
  end

end