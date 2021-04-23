Rails.application.routes.draw do
    root 'welcome#home'
    get '/about', to: 'welcome#about'
    get '/contact', to: 'welcome#contact'
    get '/auth/github/callback', to: 'sessions#github'
    delete '/users/:user_id/playlists/:id', to: 'playlists#destroy'
    # delete '/albums/:album_id/comments/:id(', to: 'comments#destroy', as: 'destory_full'


  Rails.application.routes.draw do
        resources :tracks do
          collection do
            get :top_100
            get :random
            get :search
          end
        end
      end


    resources :users, only: [] do
      resources :playlists, only: [:index, :show, :destroy, :create, :new]
    end

    devise_for :users

    # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

    get '/artists', to: 'artists#index'
    get '/artists/:id', to: 'artists#show', as: 'artist'
    get '/search', to: 'artists#search'
    get '/albums/new', to: 'albums#new', as: 'new_album_now'


    resources :albums, only: [:show, :index] do
      resources :comments, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    end

    resources :comments
    resources :albums
    resources :welcome

    resources :playlists, only: [:create, :show]

    #shallow: true


end
