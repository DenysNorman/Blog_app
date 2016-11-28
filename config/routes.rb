Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do
    resources :comments do
      member { post :vote }
    end
    member { post :vote }
  end

  root 'posts#index'
end
