Rails.application.routes.draw do
    root 'welcome#index'
    get '/artists', to: 'artists#index'
    get '/artists/:id', to: 'artists#show', as: 'artist'
    get '/search', to: 'artists#search'
    get '/albums/new', to: 'albums#new', as: 'new_album_now'



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

    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }


    # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


    resources :albums, only: [:show, :index] do
      resources :comments, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    end

    resources :comments
    resources :albums
    resources :welcome

    resources :playlists, only: [:create, :show]

    #shallow: true


end
