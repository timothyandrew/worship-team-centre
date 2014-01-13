WorshipTeamCenter::Application.routes.draw do
  resources :song_lists, except: [:destroy]
  resources :songs, except: [:destroy]
  root to: "song_lists#index"
end
