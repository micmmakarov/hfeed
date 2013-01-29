Hn::Application.routes.draw do



  devise_for :users

  namespace :api do
    get 'articles/highlights' => "articles#index", :data => 'highlights'
    resources :articles do
      resources :comments
    end
    post 'articles/:id/add_score' => "articles#add_score"
  end

  root :to => 'home#index'
  get ':provider/callback' => "home#callback"

  match '*path' => "home#index"

end
