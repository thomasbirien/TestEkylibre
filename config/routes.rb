Rails.application.routes.draw do
  root to: 'tanks#index'

  resources :tanks do
    resources :activities
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
