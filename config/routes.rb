Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  # root 'comments#index'
  root "homes#index"
    resources  :bodytemperatures
    resources  :humen
    resources  :homes
  # get"/bodytemperatures/alert", to:"bodytemperatures#alert"
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
