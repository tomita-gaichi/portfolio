Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get 'sign_up'  => 'users/registrations#new'
    get 'sign_in'  => 'devise/sessions#new'
    get 'sign_in'  => 'devise/sessions#create'
    get 'sign_out' => 'devise/sessions#destroy'
  end
  
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
