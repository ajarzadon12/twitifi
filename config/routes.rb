Rails.application.routes.draw do
  resources :posts

  resources :follow do
    member do
      post :follow
      delete :unfollow
      delete :remove_follower
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  scope '(:locale)' do
    devise_scope :user do
      get 'sign_in', to: 'users/sessions#new'
      get 'sign_up', to: 'users/registrations#new'
      get 'sign_out', to: 'users/sessions#destroy'
    end

    authenticated :user do
      match 'profile(/:username)' => 'profile#index', via: [:get], as: 'profile'

      root to: 'welcome#index'
    end

    root to: 'landing#index'
  end
end
