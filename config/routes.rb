Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :collectors, only: %i[show create destroy] do
        resources :collections, only: %i[index show create destroy]
      end
      resources :albums, only: %i[index show create update]
    end
  end
end
