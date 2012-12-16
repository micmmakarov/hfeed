Hn::Application.routes.draw do

  devise_for :users

  namespace :api do
    resources :articles
  end

  root :to => 'home#index'

  match '*path' => "home#index"

end
