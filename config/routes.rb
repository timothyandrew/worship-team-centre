WorshipTeamCenter::Application.routes.draw do
  resources :song_lists
  resources :songs
  root to: "song_lists#index"
end
