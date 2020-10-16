Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        token_validations: 'api/v1/devise_token_auth/token_validations'
      }
      get '/courses', to: 'courses#index', as: 'courses'
      get '/courses/:id', to: 'courses#show'

      get '/teachers', to: 'teachers#index'
      get '/teachers/courses', to: 'teachers#courses', as: 'teacher_courses'
      get '/teachers/:id', to: 'teachers#show'
      get '/search', to: 'teachers#autocomplete_search'

      post '/teacher_review/new', to: 'teacher_reviews#create'
      get '/latest_reviews', to: 'teacher_reviews#latest_reviews'
      get '/teacher_reviews/teacher/:teacher_id', to: 'teacher_reviews#teacher_reviews'

      post '/course_review/new', to: 'course_reviews#create'
      get '/course_reviews/course/:course_id', to: 'course_reviews#course_reviews'
    end
  end
  devise_for :users
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
