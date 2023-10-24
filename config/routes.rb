Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
      delete "completed", to: "tasks#destroy_completed"
      delete "archived", to: "tasks#destroy_archived"
      patch "archived/:id", to: "tasks#archive_task"
      patch "archived", to: "tasks#retrieve_archived"
    end
  end
end
