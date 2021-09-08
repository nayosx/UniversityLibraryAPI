Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :roles, :users, :authors, :genders, :books, :loans
    end
  end

  post "api/v1/users/auth/login", to: "api/v1/users#login"
  post "api/v1/users/auth/logout", to: "api/v1/users#logout"

end
