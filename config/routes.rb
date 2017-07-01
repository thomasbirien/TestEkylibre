Rails.application.routes.draw do
  post 'interventions/add'

  post 'interventions/remove'

  post 'interventions/traitement'

  post 'interventions/transfert'

  root to: 'tanks#index'

  resources :tanks do
    resources :activities
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
