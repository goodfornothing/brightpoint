Brightpoint::Application.routes.draw do
  
  devise_for :users

  namespace :api do
    namespace :v1  do
    	get "data_points" => "data_points#index"
      get "chromosome/:chromosome" => "data_points#chromosome"
    	get "subjects" => "subjects#index"
      get "subjects/next" => "subjects#first"
      get "subjects/:previous_subject/next" => "subjects#next"
      get "subjects/:subject/classifications" => "classifications#index"
      post "classifications" => "classifications#create"
    end
  end

end