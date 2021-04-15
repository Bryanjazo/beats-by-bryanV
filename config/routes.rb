Rails.application.routes.draw do


    root 'welcome#home'
    get '/about', to: 'welcome#about'
    get '/contact', to: 'welcome#contact'
    get '/auth/spotify/callback', to: 'users#spotify'

    resources :users, only: [] do
      resources :playlists, only: [:index, :show, :destroy, :create]
    end

    devise_for :users, controllers: { sessions: 'users/sessions' }

    # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

    get '/artists', to: 'artists#index'
    get '/artists/:id', to: 'artists#show', as: 'artist'
    get '/search', to: 'artists#search'

    resources :albums, only: [:show, :index] do
      resources :reviews, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    end

    resources :comments, only: [:destroy, :edit, :update, :create]

    resources :playlists, only: [:create, :show]

    #shallow: true


end
