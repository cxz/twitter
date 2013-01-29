Trivia::Application.routes.draw do

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  resources :questions do
    member do
      put 'save_and_score' => "questions#save_and_score"
    end
  end
  resources :users

  root :to => 'pages#main'

end
