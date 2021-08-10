Rails.application.routes.draw do
  get '/tasks', to: 'tasks#index', as: :index
  get 'tasks/:id', to: 'tasks#show', as: :task
end
