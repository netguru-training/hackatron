Hackatron::Application.routes.draw do
  get 'participations/create'

  get 'participations/destroy'

  root "pages#home"
  match "home", to: "pages#home", as: "home", via: [:get, :post]

  devise_for :users, controllers: {registrations: "registrations"}

  namespace :admin do
    root "base#index"
    resources :users
  end

  resources :events, shallow: true do
    resources :participations, only: [:create, :destroy] do
      member do
        post 'approve'
      end
    end
  end
end
