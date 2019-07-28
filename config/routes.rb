Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"

    get "/tasks" => "tasks#index"
    get "/tasks/:id" => "tasks#show"
  end
end
