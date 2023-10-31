Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
      delete "delete_all", to: "tasks#destroy_all"
      patch "archived/:id", to: "tasks#archive_task"
      patch "archived", to: "tasks#retrieve_archived"
    end
  end
end
