Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        token_validations: 'api/v1/devise_token_auth/token_validations'
      }
      resources :teachers
      resources :courses
      resources :schools
      resources :faculties
      resources :teacher_courses
      resources :teacher_reviews
      resources :course_reviews

      get '/teachers/courses/:id', to: 'teachers#courses'
      get '/search', to: 'teachers#autocomplete_search'
      get '/latest_reviews', to: 'teacher_reviews#latest_reviews'
      get '/teacher_reviews/teacher/:teacher_id', to: 'teacher_reviews#teacher_reviews'
      get '/course_reviews/course/:course_id', to: 'course_reviews#course_reviews'
    end
  end
  devise_for :users
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
