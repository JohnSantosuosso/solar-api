# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'login', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'
  end

  namespace :api do
    namespace :v1 do
      get 'external_services/fetch_data', to: 'external_services#fetch_data'
    end
  end
end
