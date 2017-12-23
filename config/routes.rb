Rails.application.routes.draw do
  root to: "notes#index"
  get '/notes/:id/finalize', to: "notes#finalize"
  get '/notes/all', to: "notes#ver_todas"
  get '/notes/end', to: "notes#finalizeds"

  resources :notes
end
