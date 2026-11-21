Rails.application.routes.draw do
  devise_for :users
  root "animals#index"

  get "about", to: "pages#about", as: :about
  get "profile", to: "pages#profile", as: :profile

  resources :animals do
    collection do
      delete :destroy_all
    end
  end

  resources :users
  get "hi/index"

  get "up" => "rails/health#show", as: :rails_health_check
end
