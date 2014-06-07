WorshipTeamCenter::Application.routes.draw do
  get "planned_roster_groups/new"
  get "planned_roster_groups/edit"
  get "planned_roster_groups/create"
  get "planned_roster_groups/update"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:show]
  resources :song_lists
  resources :songs
  resources :planned_roster_groups
  root to: "song_lists#index"
end
