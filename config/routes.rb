Trivia::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :questions
  resources :users

  root :to => 'pages#main'

end
