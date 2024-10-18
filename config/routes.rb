Rails.application.routes.draw do

  get 'payments/new', to: 'payments#new', as: 'new_payment'
  post 'payments/create', to: 'payments#create', as: 'payments'
  get 'payments/success', to: 'payments#success', as: 'payment_success'

end
