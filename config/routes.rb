Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/tasks" => "tasks#index"
    post "/tasks" => "tasks#create"
    get "/tasks/:id" => "tasks#show"
  end
end
