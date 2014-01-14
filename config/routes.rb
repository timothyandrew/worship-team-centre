WorshipTeamCenter::Application.routes.draw do
  resources :song_lists
  resources :songs, except: [:destroy]
  root to: "song_lists#index"
end
