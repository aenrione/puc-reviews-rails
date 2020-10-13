Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        token_validations: 'api/v1/devise_token_auth/token_validations'
      }
      get '/courses', to: 'courses#index', as: 'courses'
      get '/courses/:id', to: 'courses#show'
      get '/teachers', to: 'teachers#index'
      get '/teachers/:id', to: 'teachers#show'
    end
  end
  devise_for :users
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
