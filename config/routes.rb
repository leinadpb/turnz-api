Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
             },
             controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
             }

  # App routes
  namespace :api do
    namespace :v1 do

      # Testing purposes
      namespace :test do
        get '/', to: 'tests#test'
      end

      # Company
      namespace :company do
        get '/', to: 'companies#show'
        get '/:id', to: 'companies#show_by_id'
      end

      # Employee
      namespace :employee do
        get '/', to: 'employees#show'
        get '/:id', to: 'employees#show_by_id'
        post '/add_zdate', to: 'employees#add_zdate'
        post '/remove_zdate', to: 'employees#remove_zdate'
      end

    end
  end
end
