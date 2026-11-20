Rails.application.routes.draw do
  root "animals#index"

  get "about", to: "pages#about", as: :about

  resources :animals do
    collection do
      delete :destroy_all
    end
  end

  resources :users
  get "hi/index"

  get "up" => "rails/health#show", as: :rails_health_check
end
