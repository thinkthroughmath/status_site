Rails.application.routes.draw do
  devise_for :admins

  resources :messages do
    get :next, on: :collection
    get :admin, on: :collection
  end
  resources :admin_dashboards, only: [:index]
  resources :public_dashboards, only: [:index]
  resources :issues, only: [:index, :create, :new, :edit, :update, :show] do
    resources :updates, only: [:index, :new, :create]
    get :admin, on: :collection
  end
  resources :upcoming_maintenances, only: [:index]
  resources :email_subscriptions, only: [:create] do
    get :confirm, on: :member
  end

  root to: 'public_dashboards#index'
end
