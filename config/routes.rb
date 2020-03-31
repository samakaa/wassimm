Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
               :path=> '',
               :path_names=> {:sign_in=> 'login', :sign_out=> 'logout', :edit=> 'profile'},
               :controllers=> {:registrations=> 'registrations',
                               :confirmations => 'confirmations',
                               :omniauth_callbacks => 'omniauth_callbacks'
                             }
resources :annouces, path:'annonce' do

            resources :reviews, only: [:create, :destroy]

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'pages#home'
# chemin d'accès de la méthode show du controller User
resources :users, only: [:show]
resources :rooms, path:'annonces' do

            resources :reservations, only: [:create]
            resources :reviews, only: [:create, :destroy]

end
resources :photos
resources :conversations, only: [:index, :create] do

       resources :messages, only: [:index, :create]

 end
get '/preload' => 'reservations#preload'
get '/preview' => 'reservations#preview'
get :your_trips, to: 'reservations#your_trips' , path: 'mes_voyages'
get :your_reservations , to: 'reservations#your_reservations', path: 'mes_reservations'
get '/search' => 'pages#search'
end
