Rails.application.routes.draw do
  devise_for :accounts
  get '/browse' => 'browse#browse', as: :browse
  root "public#home"
end
