Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
  get '/new_game',     to: 'game#index'
  #post '/new_game', :to => 'game#index'
  resources :games
  post "/upload" => 'game#match' 
end
