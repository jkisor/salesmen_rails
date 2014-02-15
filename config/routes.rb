Sales::Application.routes.draw do
  root 'locations#index'
  resources :sales_reps
  resources :sales_groups
  resources :locations
end
