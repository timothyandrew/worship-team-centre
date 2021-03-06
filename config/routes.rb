WorshipTeamCenter::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:show]
  resources :song_lists
  resources :songs
  resources :presentations do
    collection { post :bulk_create }
  end
  resources :planned_roster_groups do
    member { post "download_package" }
  end

  resources :availability_groups
  resources :availability_summaries
  root to: "song_lists#index"
end
