Rails.application.routes.draw do

  get 'surfaces/explore'
  mount ActionCable.server => '/cable'

  localized do
    devise_for :users, only: [:sessions]

    namespace :api, :defaults => { :format => 'json' } do
      resources :locations, only: [:index, :show]

      namespace :admin do
        as :user do
          delete 'sign_out', to: '/devise/sessions#destroy'
        end
        resources :dashboard, only: :index
        resources :users, except: :show
        resources :locations, except: :show
      end
    end

    get '/admin', to: 'admin#index'
    match "/admin/*path", to: "admin#index", format: false, via: :get

    root :to => "application#index"
    match "*path", to: "application#index", format: false, via: :get
  end

end
