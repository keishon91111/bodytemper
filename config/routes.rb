Rails.application.routes.draw do
  resources :bodytemperatures
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  # root 'comments#index'
  root "homes#index"
    resources  :bodytemperatures
    resources  :employees
    resources  :homes
    get "/bodytemperature/danger", to:"bodytemperatures#danger"
  # get"/bodytemperatures/alert", to:"bodytemperatures#alert"
    get "/bodytemperature/search", to:'bodytemperatures#search'
    
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    
   
    
  end
  
end
