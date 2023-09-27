Rails.application.routes.draw do
  root to: 'incomes#index'
  resources :incomes
  resources :settlements, only: [:index, :new, :create]
  resources :spendings
end
