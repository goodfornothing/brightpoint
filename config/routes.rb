Brightpoint::Application.routes.draw do
  
  devise_for :users

  namespace :api do
    namespace :v1  do
    	get "data_points" => "data_points#index"
      get "chromosome/:chromosome" => "data_points#chromosome"
    	get "subjects" => "subjects#index"
      get "subjects/next" => "subjects#next"
      get "subjects/:previous_subject/next" => "subjects#next"
      get "subjects/:subject/annotations" => "annotations#index"
      get "subjects/:subject/classifications" => "classifications#index"
      match "subjects/:subject/classifications/new" => "classifications#create"
    end
  end

end