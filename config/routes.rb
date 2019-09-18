Rails.application.routes.draw do
  resources :stickers
  namespace :api do
    namespace :v1 do
      resources :collectors, only: %i[show create destroy] do
        resources :collections, only: %i[index show create destroy] do
          resources :stickers, only: %i[index update]
        end
      end
      resources :albums, only: %i[index show create update]
    end
  end
end
