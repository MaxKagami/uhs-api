Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :news_posts
      resources :document_groups
      resources :documents
      resources :answers
      resources :document_forms
      resources :form_mappings
      resources :services
      resources :service_mappings
    end
  end

  root to: 'home#index'

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy

end