Rails.application.routes.draw do
  #--------------------------------------------------------------
  # Routes for messages CRUD
  get '/messages/:chat_id/:application_token', to: 'messages#getChatMessages'
  post '/messages/:chat_id/:application_token', to: 'messages#addNewMessage'
  #--------------------------------------------------------------
  # Routes for chats CRUD
  get '/chats/:application_token', to: 'chats#showAppChats'
  post '/chats/:application_token', to: 'chats#createNewChat'
  #--------------------------------------------------------------
  # Routes for applications CRUD
  get '/application/:token', to: 'applications#show'
  post '/application', to: 'applications#create'
  put '/application/:token', to: 'applications#update'
  delete '/application/:token', to: 'applications#destroy'
  #--------------------------------------------------------------
  # root "articles#index"
end
