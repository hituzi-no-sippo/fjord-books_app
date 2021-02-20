Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :books
  resource :user_profile, path: 'users/profile', :only => [:new, :create, :edit, :update]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
