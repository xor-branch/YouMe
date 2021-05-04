Rails.application.routes.draw do
  devise_for :accounts
  get '/browse' => 'browse#browse', as: :browse
  get "/matches" => "browse#matches", as: :matches
  post '/approve/:id' => "browse#approve", as: :approve_user
  post '/decline/:id' => "browse#decline", as: :decline_user
  post 'get/conversation/:id' => "browse#conversation", as: :conversation

  root "public#home"
end
