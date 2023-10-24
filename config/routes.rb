Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
      delete "completed", to: "tasks#destroy_completed"
    end
  end
end
