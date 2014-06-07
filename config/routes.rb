WorshipTeamCenter::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:show]
  resources :song_lists
  resources :songs
  resources :planned_roster_groups do
    member { post "download_package" }
  end
  root to: "song_lists#index"
end
