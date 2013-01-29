Trivia::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :questions do
    collection do
      post 'answer'
    end
    member do
      post 'answer'
    end
  end

  resources :users


  root :to => 'pages#main'

end
