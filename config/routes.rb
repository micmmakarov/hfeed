Hn::Application.routes.draw do

  devise_for :users

  namespace :api do
    resources :articles
    post 'articles/:id/add_score' => "articles#add_score"
  end

  root :to => 'home#index'

  match '*path' => "home#index"

end
