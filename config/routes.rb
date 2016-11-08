Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts
  root 'posts#index'
  get  '/help',    to: 'static_pages#help'
end
