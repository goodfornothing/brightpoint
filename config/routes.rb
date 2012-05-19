Brightpoint::Application.routes.draw do
  
  namespace :api do
    namespace :v1  do
      resources :data_sets
    end
  end

end