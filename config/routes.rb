Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    scope module: :users do
      member do
        resource :followings, only: %i(show create destroy), as: 'user_followings'
        resource :followers,  only: %i(show),                as: 'user_followers'
      end
    end
  end
end
