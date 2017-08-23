Rails.application.routes.draw do
  get 'welcome/index'
  get 'landing/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  authenticated :user do
    root to: 'welcome#index'
  end

  root to: 'landing#index'
end
