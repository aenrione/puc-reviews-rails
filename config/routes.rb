Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
    end
  end
  devise_for :users
  mount Sidekiq::Web => '/queue'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home_page"
  get "about", to: "home#about"
  post "home", to: "home#login"
  get "logout", to: "home#logout"
  resources :users
  resources :courses
  resources :schools
  resources :teachers
  resources :faculties
  resources :teacher_reviews
  resources :course_reviews
end
