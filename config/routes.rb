Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :orulo_buildings, only: [:index, :show], :defaults => { :format => 'json' }
      resources :buildings, only: [:create, :show,], :defaults => { :format => 'json'}
      resources :favorites, only: [:create, :destroy, :show], :defaults => { :format => 'json'}
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
