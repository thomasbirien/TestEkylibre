Rails.application.routes.draw do
  post 'interventions/add'

  post 'interventions/remove'

  post 'interventions/traitement'

  post 'interventions/transfert'

  root to: 'tanks#index'

  resources :tanks do
    get 'activities/resume_add_or_remove'
    get 'activities/resume_transfert'
    post 'activities/create_activity_transfert'
    resources :activities, except: :index
  end
  resources :activities, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
