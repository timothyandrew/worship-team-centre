WorshipTeamCenter::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:show]
  resources :song_lists
  resources :songs
  root to: "song_lists#index"
end
