Hackatron::Application.routes.draw do
  get 'participations/create'

  get 'participations/destroy'

  root "events#index"
  get "home", to: "pages#home", as: "home"

  devise_for :users

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
