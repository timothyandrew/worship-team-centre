WorshipTeamCenter::Application.routes.draw do
  devise_for :users
  resources :song_lists
  resources :songs
  root to: "song_lists#index"
end
