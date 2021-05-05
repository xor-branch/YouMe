Rails.application.routes.draw do
  devise_for :accounts

  resources "conversations" do
    resources "messages"
  end


  get '/browse' => 'browse#browse', as: :browse
  get "/matches" => "browse#matches", as: :matches
  post '/approve/:id' => "browse#approve", as: :approve_user
  post '/decline/:id' => "browse#decline", as: :decline_user
  post 'get/conversation/:id' => "browse#open_conversation", as: :open_conversation

  root "public#home"
end
