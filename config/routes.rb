Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :collectors
      resources :albums
    end
  end
end
