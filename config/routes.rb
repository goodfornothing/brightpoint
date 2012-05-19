Brightpoint::Application.routes.draw do
  
  devise_for :users

  namespace :api do
    namespace :v1  do
    	get "data_points" => "data_sets#index"
    	get "subjects" => "subjects#index"
      get "subjects/random" => "subjects#random"
      get "classifications/new" => "classifications#new"
    end
  end

end